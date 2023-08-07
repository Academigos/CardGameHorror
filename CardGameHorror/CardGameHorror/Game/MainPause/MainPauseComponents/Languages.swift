//
//  Languages.swift
//  CardGameHorror
//
//  Created by Eduardo on 21/07/23.
//

import SpriteKit

///Classe para definir o botão de troca de linguagem 
class Languages: SKSpriteNode{
    let languages: SKTexture
    let newLanguage: [String] = ["pt-BR", "en"]
    var LanguageLabel: SKLabelNode = SKLabelNode()
    var currentScene: String
    var isBackScene: String?
    
    init(currentScene: String) {
        self.currentScene = currentScene
        self.languages = SKTexture(imageNamed: "Langueges")
        super.init(texture: languages, color: .clear, size: languages.size())
        setupLanguageLabel()
        isUserInteractionEnabled = true
    }
    
    init(currentScene: String, isBackScene: String) {
        self.isBackScene = isBackScene as String
        self.currentScene = currentScene
        self.languages = SKTexture(imageNamed: "Langueges")
        super.init(texture: languages, color: .clear, size: languages.size())
        setupLanguageLabel()
        isUserInteractionEnabled = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if  LanguageManager.shared.currentLanguage == "pt-BR"{
            LanguageManager.shared.setLanguage(newLanguage[1])
        }else{
            LanguageManager.shared.setLanguage(newLanguage[0])
        }
        
        ///validação para poder retornar a scene anterior
        if currentScene == "GameScene" {
            if let currentScene = self.scene {
                let transition = SKTransition.fade(withDuration: 0.5)
                let mainMenuScene = GameScene(size: currentScene.size)
                currentScene.view?.presentScene(mainMenuScene, transition: transition)
            }
        }else if currentScene == "Intro" {
            if let currentScene = self.scene {
                let transition = SKTransition.fade(withDuration: 0.5)
                let mainMenuScene = IntroScene(size: currentScene.size)
                currentScene.view?.presentScene(mainMenuScene, transition: transition)
            }
        }else if currentScene == "EndPlayer" {
            if let currentScene = self.scene {
                let transition = SKTransition.fade(withDuration: 0.5)
                let mainMenuScene = PlayerEnd(size: currentScene.size)
                currentScene.view?.presentScene(mainMenuScene, transition: transition)
            }
        }else if currentScene == "EndMonster" {
            if let currentScene = self.scene {
                let transition = SKTransition.fade(withDuration: 0.5)
                let mainMenuScene = MonsterEnd(size: currentScene.size)
                currentScene.view?.presentScene(mainMenuScene, transition: transition)
            }
        }else if currentScene == "MainMenu" {
            if let currentScene = self.scene {
                let transition = SKTransition.fade(withDuration: 0.5)
                let mainMenuScene = MainMenuScene(size: currentScene.size)
                currentScene.view?.presentScene(mainMenuScene, transition: transition)
            }
        }else if currentScene == "CreditsScene" {
            if let currentScene = self.scene {
                let transition = SKTransition.fade(withDuration: 0.5)
                let mainMenuScene = CreditsScene(backScene: isBackScene!, size: currentScene.size) // Assuming MainMenuScene is the class for the scene you want to transition to.
                currentScene.view?.presentScene(mainMenuScene, transition: transition)
            }
        }
    }
    
    ///formatar o texto
    private func setupLanguageLabel() {
        LanguageLabel.name = "LanguegeLabel"
        LanguageLabel.fontSize = size.height * 0.4
        LanguageLabel.fontName = "BreeSerif-Regular"
        LanguageLabel.fontColor = SKColor(red: CGFloat(0x17) / 255.0, green: CGFloat(0x18) / 255.0, blue: CGFloat(0x1C) / 255.0, alpha: 1.0)
        LanguageLabel.text = LanguageManager.shared.localizedString("pt-BR")
        LanguageLabel.position = CGPoint(x: size.width * 0, y: size.height * -0.1)
        LanguageLabel.zPosition = 101.0
        addChild(LanguageLabel)
    }
}