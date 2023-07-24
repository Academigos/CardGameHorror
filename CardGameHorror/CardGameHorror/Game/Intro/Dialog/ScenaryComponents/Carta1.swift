//
//  Carta1.swift
//  CardGameHorror
//
//  Created by Luiz Felipe on 24/07/23.
//

import SpriteKit

class Carta1: SKSpriteNode{
    let carta1 : SKTexture
    
    init(carta1: String) {
        self.carta1 = SKTexture(imageNamed: carta1)
        super.init(texture: self.carta1, color: .clear, size: self.carta1.size())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

