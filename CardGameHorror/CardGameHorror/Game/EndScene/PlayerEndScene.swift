//
//  PlayerEndScene.swift
//  CardGameHorror
//
//  Created by Eduardo on 23/07/23.
//

import Foundation
import SpriteKit

class PlayerEnd: SKScene {
    let resetButton = ResetButton()
    let backToMenu = MainMenuButton()
    
    override func didMove(to view: SKView) {
        resetButton.position = CGPoint(x: GameViewController.screenSize.width * 0.3 , y: GameViewController.screenSize.height * 0.5)
        addChild(resetButton)
        
        backToMenu.position = CGPoint(x: GameViewController.screenSize.width * 0.7 , y: GameViewController.screenSize.height * 0.5)
        addChild(backToMenu)
    }
}
