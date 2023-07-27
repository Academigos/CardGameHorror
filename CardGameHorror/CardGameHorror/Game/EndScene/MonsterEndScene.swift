//
//  MonsterEndScene.swift
//  CardGameHorror
//
//  Created by Eduardo on 23/07/23.
//

import Foundation
import SpriteKit

class MonsterEnd: SKScene{
    let resetButtom = ResetButton()
    let backToMenu = MainMenuButton()
    override func didMove(to view: SKView) {
        resetButtom.position = CGPoint(x: GameViewController.screenSize.width * 0.3 , y: GameViewController.screenSize.height * 0.5)
        addChild(resetButtom)
        
        backToMenu.position = CGPoint(x: GameViewController.screenSize.width * 0.7 , y: GameViewController.screenSize.height * 0.5)
        addChild(backToMenu)
    }
}
