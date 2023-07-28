//
//  ResetBattleButtom.swift
//  CardGameHorror
//
//  Created by Eduardo on 23/07/23.
//

import Foundation
import SpriteKit

class ResetButtom: SKSpriteNode{
    let resetButtom: SKTexture
    var resetLabel: SKLabelNode = SKLabelNode()
    
    init() {
        self.resetButtom = SKTexture(imageNamed: "Buttom")
        super.init(texture: resetButtom, color: .clear, size: resetButtom.size())
        scale(to: autoScale(self, widthProportion: 0.4, screenSize: GameViewController.screenSize))
        setupResetLabel()
        isUserInteractionEnabled = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let currentScene = self.scene {
            let transition = SKTransition.fade(withDuration: 0.5)
            let mainMenuScene = GameScene(size: currentScene.size) // Assuming MainMenuScene is the class for the scene you want to transition to.
            currentScene.view?.presentScene(mainMenuScene, transition: transition)
            // Call the startNewGame() function from the GameController
        }
    }
    private func setupResetLabel() {
        
        resetLabel.name = "ContinueLabel"
        resetLabel.fontSize = size.height * 0.12
        resetLabel.fontName = "BreeSerif-Regular"
        resetLabel.fontColor = SKColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1.0)
        resetLabel.text = LanguageManager.shared.localizedString("Recomeçar Batalha")
        resetLabel.position = CGPoint(x: size.width * 0, y: size.height * 0)
        resetLabel.zPosition = 1.0
        addChild(resetLabel)
    }
}
