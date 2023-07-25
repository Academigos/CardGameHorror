//
//  Skip.swift
//  CardGameHorror
//
//  Created by Eduardo on 25/07/23.
//

import Foundation
import SpriteKit

class SkipButtom:SKSpriteNode{
    let skipTexture: SKTexture
    
    init() {
        self.skipTexture = SKTexture(imageNamed: "skip")
        super.init(texture: skipTexture, color: .clear, size: skipTexture.size())
        self.scale(to: autoScale(self, widthProportion: 0.06, screenSize: GameViewController.screenSize))
        self.position = CGPoint(x: GameViewController.screenSize.width * 0.10, y: GameViewController.screenSize.height * 0.90)
        self.zPosition = 100
        isUserInteractionEnabled = true
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let currentScene = self.scene {
            let transition = SKTransition.fade(withDuration: 0.5)
            let mainMenuScene = DayNightTransitionScene(size: currentScene.size) // Assuming MainMenuScene is the class for the scene you want to transition to.
            currentScene.view?.presentScene(mainMenuScene, transition: transition)
        }
    }
}
