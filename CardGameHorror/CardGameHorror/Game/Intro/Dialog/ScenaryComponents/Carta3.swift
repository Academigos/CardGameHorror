//
//  Carta3.swift
//  CardGameHorror
//
//  Created by Luiz Felipe on 24/07/23.
//

import SpriteKit

class Carta3: SKSpriteNode{
    let carta3 : SKTexture
    
    init(carta3: String) {
        self.carta3 = SKTexture(imageNamed: carta3)
        super.init(texture: self.carta3, color: .clear, size: self.carta3.size())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
