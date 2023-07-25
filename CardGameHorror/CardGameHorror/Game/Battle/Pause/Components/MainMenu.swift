//
//  MainMenu.swift
//  CardGameHorror
//
//  Created by Eduardo on 21/07/23.
//

import Foundation
import SpriteKit

class MainMenu: SKSpriteNode{
    let mainMenu: SKTexture
    weak var delegate: ClosePauseDelegate?
    var mainMenuLabel: SKLabelNode = SKLabelNode()
    
    init() {
        self.mainMenu = SKTexture(imageNamed: "Buttom")
        super.init(texture: mainMenu, color: .clear, size: mainMenu.size())
        isUserInteractionEnabled = true
        setupMainMenuLabel()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // Change the color when touched (for example, to red)
        self.texture = SKTexture(imageNamed: "PressedButtom")
        
        // Add a slight delay (e.g., 0.1 seconds) to revert the color back to clear
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            self.texture = self.mainMenu
        }
        
        if let currentScene = self.scene {
            let transition = SKTransition.fade(withDuration: 0.5)
            let mainMenuScene = MainMenuScene(size: currentScene.size) // Assuming MainMenuScene is the class for the scene you want to transition to.
            currentScene.view?.presentScene(mainMenuScene, transition: transition)
            // Call the startNewGame() function from the GameController
            delegate?.closePauseButtonTapped()
            GameController.shared.selectedCard = []
        }
    }
    
    private func setupMainMenuLabel() {
        mainMenuLabel.name = "mainMenuLabel"
        mainMenuLabel.fontSize = size.height * 0.32
        mainMenuLabel.fontName = "BreeSerif-Regular"
        mainMenuLabel.fontColor = SKColor(red: CGFloat(0x17) / 255.0, green: CGFloat(0x18) / 255.0, blue: CGFloat(0x1C) / 255.0, alpha: 1.0)
        mainMenuLabel.text = LanguageManager.shared.localizedString("Menu Principal")
        mainMenuLabel.position = CGPoint(x: size.width * 0, y: size.height * -0.1)
        mainMenuLabel.zPosition = 1.0
        
        addChild(mainMenuLabel)
    }
}
