//
//  BackToMainMenu.swift
//  CardGameHorror
//
//  Created by Eduardo on 23/07/23.
//

import Foundation
import SpriteKit

///Classe que define o botão para retornar ao menu principal
class MainMenuButtom: SKSpriteNode{
    let resetButtom: SKTexture
    var mainMenuLabel: SKLabelNode = SKLabelNode()
    init() {
        self.resetButtom = SKTexture(imageNamed: "Buttom")
        super.init(texture: resetButtom, color: .clear, size: resetButtom.size())
        scale(to: autoScale(self, widthProportion: 0.21, screenSize: GameViewController.screenSize))
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
    
    //formata o texto
    private func setupMainMenuLabel() {
        mainMenuLabel.name = "ContinueLabel"
        mainMenuLabel.fontSize = self.size.height * 0.3
        mainMenuLabel.fontName = "BreeSerif-Regular"
        mainMenuLabel.fontColor = SKColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1.0)
        mainMenuLabel.text = LanguageManager.shared.localizedString("Menu Principal")
        mainMenuLabel.position = CGPoint(x: size.width * 0, y: size.height * -0.1)
        mainMenuLabel.zPosition = 1.0
        addChild(mainMenuLabel)
    }
}
