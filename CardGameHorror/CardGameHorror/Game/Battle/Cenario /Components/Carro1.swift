//
//  Carro1.swift
//  CardGameHorror
//
//  Created by Luiz Felipe on 20/07/23.
//

import SpriteKit

///Define textura do carro
class Carro1: SKSpriteNode {
    let carro1 : SKTexture
    
    init(carro1: String) {
        self.carro1 = SKTexture(imageNamed: carro1)
        super.init(texture: self.carro1, color: .clear, size: self.carro1.size())
        self.scale(to: GameViewController.screenSize)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
