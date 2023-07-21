//
//  Carro2.swift
//  CardGameHorror
//
//  Created by Luiz Felipe on 20/07/23.
//

import SpriteKit

class Carro2: SKSpriteNode{
    let carro2 : SKTexture
    
    init(carro2: String) {
        self.carro2 = SKTexture(imageNamed: carro2)
        super.init(texture: self.carro2, color: .clear, size: self.carro2.size())
        self.scale(to: autoScale(self, widthProportion: 1, screenSize: GameViewController.screenSize))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
