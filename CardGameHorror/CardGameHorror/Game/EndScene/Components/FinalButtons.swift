//
//  FinalButtons.swift
//  CardGameHorror
//
//  Created by Luiz Felipe on 28/07/23.
//

import SpriteKit

class FinalButton: SKSpriteNode{
    let finalButton : SKTexture
    
    init(finalButton: String) {
        self.finalButton = SKTexture(imageNamed: finalButton)
        super.init(texture: self.finalButton, color: .clear, size: self.finalButton.size())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
