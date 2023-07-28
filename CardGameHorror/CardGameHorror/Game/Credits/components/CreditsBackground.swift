//
//  CreditsBackground.swift
//  CardGameHorror
//
//  Created by Eduardo on 28/07/23.
//

import Foundation
import SpriteKit

class CreditsBackground:SKSpriteNode{
    let background: SKTexture
    init() {
        self.background = SKTexture(imageNamed: "CreditsBackground")
        super.init(texture: background, color: .clear, size: background.size())
        
        if GameController.shared.getDeviceModel() == "iPhone SE" || GameController.shared.getDeviceModel() == "iPhone 8" || GameController.shared.getDeviceModel() == "iPhone x" || GameController.shared.getDeviceModel() == "iPhone 11" || GameController.shared.getDeviceModel() == "iPhone 12"{
            if let currentScene = self.scene {
                currentScene.scaleMode = .aspectFit
            }
        }else{
            self.scale(to: GameViewController.screenSize)
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
