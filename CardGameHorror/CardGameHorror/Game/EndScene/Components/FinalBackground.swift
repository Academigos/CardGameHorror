//
//  FinalBackground.swift
//  CardGameHorror
//
//  Created by Luiz Felipe on 26/07/23.
//

import SpriteKit

class FinalBackground:SKSpriteNode{
    let finalBackground : SKTexture
    
    init(finalBackground: String) {
        self.finalBackground = SKTexture(imageNamed: finalBackground)
        super.init(texture: self.finalBackground, color: .clear, size: self.finalBackground.size())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
