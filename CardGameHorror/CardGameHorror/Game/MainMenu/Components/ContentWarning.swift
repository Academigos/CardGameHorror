//
//  ContentWarning.swift
//  CardGameHorror
//
//  Created by Giovanni Favorin de Melo on 28/07/23.
//

import SpriteKit

///aviso de conteúdo sensível
class ContentWarning:SKSpriteNode {
    private let warningTexture:SKTexture
    
    init() {
        if LanguageManager.shared.currentLanguage == "pt-BR"{
            warningTexture = SKTexture(imageNamed: "ContentWarning")
        } else {
            warningTexture = SKTexture(imageNamed: "ContentWarningENG")
        }
        
        super.init(texture: warningTexture, color: UIColor.clear, size: warningTexture.size())
        self.position = CGPoint(x: GameViewController.screenSize.width * 0.5, y: GameViewController.screenSize.height * 0.5)
        self.zPosition = 20
        if GameController.shared.getDeviceModel() == "iPhone SE" || GameController.shared.getDeviceModel() == "iPhone 8" || GameController.shared.getDeviceModel() == "iPhone x" || GameController.shared.getDeviceModel() == "iPhone 12" {
            if let currentScene = self.scene {
                currentScene.scaleMode = .aspectFit
            }
        }else {
            self.scale(to: GameViewController.screenSize)
        }
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
