//
//  BackToMainMenu.swift
//  CardGameHorror
//
//  Created by Eduardo on 23/07/23.
//

import Foundation
import SpriteKit

///SpriteNode responsável por gerir o botão de retornar ao menu principal
class MainMenuButton: SKSpriteNode{
    let resetButton: SKTexture
    var mainMenuLabel: SKLabelNode = SKLabelNode()
    
    init() {
        self.resetButton = SKTexture(imageNamed: "Button")
        super.init(texture: resetButton, color: .clear, size: resetButton.size())
        scale(to: autoScale(self, widthProportion: 0.4, screenSize: GameViewController.screenSize))
        isUserInteractionEnabled = true
        setupMainMenuLabel()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let currentScene = self.scene {
            let transition = SKTransition.fade(withDuration: 0.5)
            let mainMenuScene = MainMenuScene(size: currentScene.size)
            currentScene.view?.presentScene(mainMenuScene, transition: transition)
        }
    }
    
    ///Responsável por configurar o Texto presente no botao de retornar
    private func setupMainMenuLabel() {
        mainMenuLabel.fontSize = size.height * 0.3
        mainMenuLabel.fontName = "BreeSerif-Regular"
        mainMenuLabel.fontColor = SKColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1.0)
        mainMenuLabel.text = LanguageManager.shared.localizedString("Menu Principal")
        mainMenuLabel.position = CGPoint(x: size.width * 0, y: size.height * 0)
        mainMenuLabel.zPosition = 1.0
        addChild(mainMenuLabel)
    }
}
