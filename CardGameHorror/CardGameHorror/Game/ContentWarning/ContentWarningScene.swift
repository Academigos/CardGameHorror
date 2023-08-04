//
//  ContentWarningScene.swift
//  CardGameHorror
//
//  Created by Eduardo on 03/08/23.
//

import Foundation
import SpriteKit

class ContentWarningScene: SKScene{
    let contentWarning = ContentWarning()
    
    
    override func didMove(to view: SKView) {
        addChild(contentWarning)
        
        Timer.scheduledTimer(withTimeInterval: 3.5, repeats: false) { timer in
            if let currentScene = self.scene {
                let transition = SKTransition.fade(withDuration: 0.5)
                let mainMenuScene = MainMenuScene(size: currentScene.size) // Assuming MainMenuScene is the class for the scene you want to transition to.
                currentScene.view?.presentScene(mainMenuScene, transition: transition)
            }
        }
    }
    
}
