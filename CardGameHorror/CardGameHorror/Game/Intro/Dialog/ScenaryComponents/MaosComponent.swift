//
//  MaosComponent.swift
//  CardGameHorror
//
//  Created by Luiz Felipe on 24/07/23.
//

import SpriteKit

class MaosComponent: SKSpriteNode{
    let maos : SKTexture
    
    init(background: String) {
        self.background = SKTexture(imageNamed: background)
        super.init(texture: self.background, color: .clear, size: self.background.size())
        self.scale(to: GameViewController.screenSize)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
