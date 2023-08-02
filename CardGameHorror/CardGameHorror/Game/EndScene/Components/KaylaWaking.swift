//
//  KaylaWaking.swift
//  CardGameHorror
//
//  Created by Luiz Felipe on 25/07/23.
//

import SpriteKit

class KaylaWaking:SKSpriteNode{
    var kaylaWaking: [SKTexture]?
    let kaylaWaking0:SKTexture
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("erro")
    }
    init(imagem0:String,imagens:String,pasta:String){
        kaylaWaking0 = SKTexture(imageNamed: imagem0)
        super.init(texture: kaylaWaking0, color: UIColor.clear, size: kaylaWaking0.size())
        KaylaAnimation(nomeDaImagem: imagens, nomeDaPasta: pasta)
    }
    
    func KaylaAnimation(nomeDaImagem:String, nomeDaPasta:String) {
        kaylaWaking = getTexture(with: nomeDaImagem, textureAtlasName: nomeDaPasta)
        let kaylaWakingd = kaylaWaking!
        
        let action = SKAction.animate(with: kaylaWakingd, timePerFrame: 4/TimeInterval(kaylaWakingd.count), resize: false, restore: true)
        self.run(action)
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
