//
//  PlayerEndScene.swift
//  CardGameHorror
//
//  Created by Eduardo on 23/07/23.
//

import Foundation
import SpriteKit

class PlayerEnd: SKScene{
    let resetButtom = ResetButtom()
    let backToMenu = MainMenuButtom()
    override func didMove(to view: SKView) {
        resetButtom.position = CGPoint(x: GameViewController.screenSize.width * 0.3 , y: GameViewController.screenSize.height * 0.5)
        addChild(resetButtom)
        
        backToMenu.position = CGPoint(x: GameViewController.screenSize.width * 0.7 , y: GameViewController.screenSize.height * 0.5)
        addChild(backToMenu)
    }
}
