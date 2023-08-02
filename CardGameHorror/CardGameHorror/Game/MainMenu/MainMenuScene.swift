//
//  MainMenuScene.swift
//  CardGameHorror
//
//  Created by Eduardo on 23/07/23.
//

import Foundation
import SpriteKit

class MainMenuScene: SKScene, ContinueGameButtomDelegate, NewGameButtomDelegate, closeOverlay {
    
    let background = MainMenuBackground()
    let startGame = NewGameButtom()
    
    let diaryOne = Diary()
    let overlayDiary = OverlayDiary()
    
    let pause = MainPause(isIntro: false, currentScene: "MainMenu")
    
    override func didMove(to view: SKView) {
        let contentWarning = ContentWarning()

        addChild(contentWarning)
        
        Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false) { [weak contentWarning] timer in
            contentWarning?.removeFromParent()
        }
        
        let continueGame = ContinueGameButtom()
        
        continueGame.zPosition = 1
        continueGame.position = CGPoint(x: GameViewController.screenSize.width * 0.20, y: GameViewController.screenSize.height * 0.58)
        addChild(continueGame)
        pause.zPosition = 10
        addChild(pause)
        startGame.zPosition = 1
        startGame.position = CGPoint(x: GameViewController.screenSize.width * 0.49, y: GameViewController.screenSize.height * 0.55)
        addChild(startGame)
        
        background.zPosition = 0
        background.position = CGPoint(x: GameViewController.screenSize.width * 0.5, y: GameViewController.screenSize.height * 0.5)
        addChild(background)
        continueGame.delegate = self
        startGame.delegate = self
        diaryOne.rightPage.continueButtonDiary.delegate = self
    }
    
    func continueGameButtonTapped() {
        // Transition to the GameScene when the button is tappedlet transition = SKTransition.crossFade(withDuration: 0.5)
        let gameScene = GameScene(size: GameViewController.screenSize)
        gameScene.scaleMode = .aspectFill
        let transition = SKTransition.fade(with: .black, duration: 1)
        self.view?.presentScene(gameScene,transition: transition)
    }
    
    func newGameButtonTapped() {
        let gameScene = IntroScene(size: GameViewController.screenSize)
        gameScene.scaleMode = .aspectFill
        let transition = SKTransition.fade(with: .black, duration: 1)
        self.view?.presentScene(gameScene,transition: transition)
    }
    
    func openDiaryOne() {
        
        diaryOne.position = CGPoint(x: GameViewController.screenSize.width * 0.5, y: -GameViewController.screenSize.height)
        
        let finalPosition = CGPoint(x: GameViewController.screenSize.width * 0.5, y: GameViewController.screenSize.height * 0.5)
        
        // Crie uma ação para mover o nó de sua posição inicial até a posição final
        let moveAction = SKAction.moveTo(y: finalPosition.y, duration: 0.6)
        // Adicione uma ação de bloqueio para manter o nó na posição final
        let holdAction = SKAction.wait(forDuration: 0.5)
        
        // Combine as ações em uma sequência
        let sequence = SKAction.sequence([moveAction, holdAction])
        
        overlayDiary.delegate = self
        overlayDiary.zPosition = 4
        diaryOne.zPosition = 5
        
        addChild(overlayDiary)
        addChild(diaryOne)
        
        overlayDiary.animationEntryOverlay()
        diaryOne.run(sequence)
    }
    
    func closeOverlay() {
        
        overlayDiary.animationExitOverlay()
        
        let finalPosition = CGPoint(x: GameViewController.screenSize.width * 0.5, y: -GameViewController.screenSize.height)
        
        // Crie uma ação para mover o nó de sua posição inicial até a posição final
        let moveAction = SKAction.moveTo(y: finalPosition.y, duration: 0.6)
        // Adicione uma ação de bloqueio para manter o nó na posição final
        let holdAction = SKAction.wait(forDuration: 0.5)
        
        // Combine as ações em uma sequência
        let sequence = SKAction.sequence([moveAction, holdAction])
        
        // Executar a animação "Pop Out"
        diaryOne.run(sequence) {
            self.startGame.isButtonInteractionEnabled = true
            self.overlayDiary.isButtonInteractionEnabled = true
            self.overlayDiary.removeFromParent()
            self.diaryOne.removeFromParent()
        }
    }
}
