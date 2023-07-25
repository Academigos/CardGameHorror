//
//  Carta2.swift
//  CardGameHorror
//
//  Created by Luiz Felipe on 24/07/23.
//

import SpriteKit

class Carta2: SKSpriteNode{
    let carta2 : SKTexture
    
    init(carta2: String) {
        self.carta2 = SKTexture(imageNamed: carta2)
        super.init(texture: self.carta2, color: .clear, size: self.carta2.size())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
