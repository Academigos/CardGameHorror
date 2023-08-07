//
//  BackButtomCredits.swift
//  CardGameHorror
//
//  Created by Eduardo on 28/07/23.
//

import Foundation
import SpriteKit

/// classe para definir o botão de retornar
class CreditBack: SKSpriteNode{
    let button: SKTexture
    var LanguageLabel: SKLabelNode = SKLabelNode()
    var currentScene: String
    
    init(currentScene: String) {
        self.currentScene = currentScene
        self.button = SKTexture(imageNamed: "buttonCreditos")
        super.init(texture: button, color: .clear, size: button.size())
        self.scale(to: autoScale(self, widthProportion: 0.2, screenSize: GameViewController.screenSize))
        setupLanguageLabel()
        isUserInteractionEnabled = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    ///Função responsável por gerir o retorno para a cena
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if currentScene == "GameScene" { // valida se a cena anterior era a GameScene
            if let currentScene = self.scene {
                let transition = SKTransition.fade(withDuration: 0.5)
                let mainMenuScene = GameScene(size: currentScene.size)
                currentScene.view?.presentScene(mainMenuScene, transition: transition)
            }
        }else if currentScene == "Intro" { // valida se a cena anterior era a Intro
            if let currentScene = self.scene {
                let transition = SKTransition.fade(withDuration: 0.5)
                let mainMenuScene = IntroScene(size: currentScene.size)
                currentScene.view?.presentScene(mainMenuScene, transition: transition)
            }
        }else if currentScene == "EndPlayer" { // valida se a cena anterior era a EndPlayer
            if let currentScene = self.scene {
                let transition = SKTransition.fade(withDuration: 0.5)
                let mainMenuScene = PlayerEnd(size: currentScene.size)
                currentScene.view?.presentScene(mainMenuScene, transition: transition)
            }
        }else if currentScene == "EndMonster" { // valida se a cena anterior era a EndMonster
            if let currentScene = self.scene {
                let transition = SKTransition.fade(withDuration: 0.5)
                let mainMenuScene = MonsterEnd(size: currentScene.size)
                currentScene.view?.presentScene(mainMenuScene, transition: transition)
            }
        }else if currentScene == "MainMenu" { // valida se a cena anterior era a MainMenu
            if let currentScene = self.scene {
                let transition = SKTransition.fade(withDuration: 0.5)
                let mainMenuScene = MainMenuScene(size: currentScene.size)
                currentScene.view?.presentScene(mainMenuScene, transition: transition)
            }
        }
    }
    
    ///Função para formatar o texto e tratar a língua
    private func setupLanguageLabel() {
        LanguageLabel.name = "LanguegeLabel"
        LanguageLabel.fontSize = size.height * 0.4
        LanguageLabel.fontName = "BreeSerif-Regular"
        LanguageLabel.fontColor = SKColor(red: CGFloat(0x17) / 255.0, green: CGFloat(0x18) / 255.0, blue: CGFloat(0x1C) / 255.0, alpha: 1.0)
        LanguageLabel.text = LanguageManager.shared.localizedString("Voltar")
        LanguageLabel.position = CGPoint(x: size.width * 0, y: size.height * -0.1)
        LanguageLabel.zPosition = 101.0
        addChild(LanguageLabel)
    }
}
