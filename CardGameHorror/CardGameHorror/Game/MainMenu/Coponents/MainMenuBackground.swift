//
//  MainMenuBackground.swift
//  CardGameHorror
//
//  Created by Eduardo on 24/07/23.
//

import Foundation
import SpriteKit

class MainMenuBackground: SKSpriteNode{
    let background: SKTexture
    
    init() {
        self.background = SKTexture(imageNamed: "MainMenuBackground")
        super.init(texture: background, color: .clear, size: background.size())
        self.scale(to: GameViewController.screenSize)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
