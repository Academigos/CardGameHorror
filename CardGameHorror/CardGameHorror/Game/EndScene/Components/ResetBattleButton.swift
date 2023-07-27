//
//  ResetBattleButtom.swift
//  CardGameHorror
//
//  Created by Eduardo on 23/07/23.
//

import Foundation
import SpriteKit

///SpriteNode responsável por gerir o botão de reset no menu de configuração
class ResetButton: SKSpriteNode{
    let resetButton: SKTexture
    var resetLabel: SKLabelNode = SKLabelNode()
    
    init() {
        self.resetButton = SKTexture(imageNamed: "Button")
        super.init(texture: resetButton, color: .clear, size: resetButton.size())
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
            let mainMenuScene = GameScene(size: currentScene.size)
            currentScene.view?.presentScene(mainMenuScene, transition: transition)
        }
    }
    
    ///Função responsável por gerir a configuração dos textos que serão apresentados
    private func setupResetLabel() {
        resetLabel.fontSize = size.height * 0.12
        resetLabel.fontName = "BreeSerif-Regular"
        resetLabel.fontColor = SKColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1.0)
        resetLabel.text = LanguageManager.shared.localizedString("Recomeçar Batalha")
        resetLabel.position = CGPoint(x: size.width * 0, y: size.height * 0)
        resetLabel.zPosition = 1.0
        addChild(resetLabel)
    }
}

