//
//  MainMenuScene.swift
//  CardGameHorror
//
//  Created by Eduardo on 23/07/23.
//

import Foundation
import SpriteKit

class MainMenuScene: SKScene, ContinueGameButtomDelegate, NewGameButtomDelegate{
    
    
    let startGame = NewGameButtom()
    let defaults = UserDefaults.standard
    var isCutScenePassed: Bool = true
    
    override func didMove(to view: SKView) {
        defaults.set(isCutScenePassed, forKey: "IsCutScenePassed")
        let continueGame = ContinueGameButtom(isCutScenePassed: isCutScenePassed)
        
        continueGame.position = CGPoint(x: GameViewController.screenSize.width * 0.2, y: GameViewController.screenSize.height * 0.7)
        addChild(continueGame)
        
        startGame.position = CGPoint(x: GameViewController.screenSize.width * 0.5, y: GameViewController.screenSize.height * 0.2)
        addChild(startGame)
        
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
        if isCutScenePassed{
            isCutScenePassed = false
        }
        let gameScene = IntroScene(size: GameViewController.screenSize)
        gameScene.scaleMode = .aspectFill
        let transition = SKTransition.fade(with: .black, duration: 1)
        self.view?.presentScene(gameScene,transition: transition)
    }
}
