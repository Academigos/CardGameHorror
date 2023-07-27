//
//  Farol.swift
//  CardGameHorror
//
//  Created by Luiz Felipe on 20/07/23.
//

import SpriteKit

class Farol:SKSpriteNode {
    var farol: [SKTexture]?
    let farol0:SKTexture
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("erro")
    }
    init(){
        farol0 = SKTexture(imageNamed: "farol01")
        super.init(texture: farol0, color: UIColor.clear, size: farol0.size())
        farolAnimation()
        self.scale(to: GameViewController.screenSize)
       
    }
   
    func farolAnimation() {
        farol = getTexture(with: "farol", textureAtlasName: "farolA")
        let farold = farol!
 
        let action = SKAction.animate(with: farold, timePerFrame: 5/TimeInterval(farold.count), resize: true, restore: true)
        self.run(SKAction.repeatForever(action))
    }
    
    
    //busca das texturas
    func getTexture(with name:String, textureAtlasName:String) -> [SKTexture] {
        let textureAtlas = SKTextureAtlas(named: textureAtlasName)
        var textures: [SKTexture] = []
        let names = textureAtlas.textureNames.sorted()
        for i in 0..<names.count{
            if names[i].contains(name){
                let texture = textureAtlas.textureNamed(names[i])
                //melhora a definicao da imagem
                texture.filteringMode = .nearest
                textures.append(texture)
            }
        }
        return textures
        
    }
}
