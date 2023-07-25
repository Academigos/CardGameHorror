//
//  MainMenuScene.swift
//  CardGameHorror
//
//  Created by Eduardo on 23/07/23.
//

import Foundation
import SpriteKit

class MainMenuScene: SKScene, ContinueGameButtomDelegate, NewGameButtomDelegate{
    
    let background = MainMenuBackground()
    let startGame = NewGameButtom()
    
    override func didMove(to view: SKView) {
        let continueGame = ContinueGameButtom()
        
        continueGame.zPosition = 1
        continueGame.position = CGPoint(x: GameViewController.screenSize.width * 0.20, y: GameViewController.screenSize.height * 0.58)
        addChild(continueGame)
        
        startGame.zPosition = 1
        startGame.position = CGPoint(x: GameViewController.screenSize.width * 0.49, y: GameViewController.screenSize.height * 0.55)
        addChild(startGame)
        
        background.zPosition = 0
        background.position = CGPoint(x: GameViewController.screenSize.width * 0.5, y: GameViewController.screenSize.height * 0.5)
        addChild(background)
        continueGame.delegate = self
        startGame.delegate = self
    }
    
    func continueGameButtonTapped() {
        // Transition to the GameScene when the button is tappedlet transition = SKTransition.crossFade(withDuration: 0.5)
        let gameScene = GameScene(size: GameViewController.screenSize)
        gameScene.scaleMode = .aspectFill
        let transition = SKTransition.fade(with: .black, duration: 1)
        self.view?.presentScene(gameScene,transition: transition)
    }
    func newGameButtonTapped() {
        if GameController.shared.isCutScenePassed{
            GameController.shared.isCutScenePassed = false
        }
        let gameScene = IntroScene(size: GameViewController.screenSize)
        gameScene.scaleMode = .aspectFill
        let transition = SKTransition.fade(with: .black, duration: 1)
        self.view?.presentScene(gameScene,transition: transition)
    }
}
