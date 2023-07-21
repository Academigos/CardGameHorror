//
//  PauseButtom.swift
//  CardGameHorror
//
//  Created by Eduardo on 21/07/23.
//

import Foundation
import SpriteKit

class PauseButtom: SKSpriteNode{
    
    let pauseButtom: SKTexture
    let pauseBackground = PauseBackground()
    let closePause = ClosePause()
    let resetBattle = ResetBattle()
    let mainMenu = MainMenu()
    
    init() {
        self.pauseButtom = SKTexture(imageNamed: "PauseButtom")
        super.init(texture: pauseButtom, color: .clear, size: pauseButtom.size())
        isUserInteractionEnabled = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if let scene = self.scene {
            if scene.isPaused == false {
                scene.isPaused = true
                
                pauseBackground.zPosition = 100
                pauseBackground.position = CGPoint(x: GameViewController.screenSize.width * 0.5, y: GameViewController.screenSize.height * 0.5)
                pauseBackground.scale(to: autoScale(pauseBackground, widthProportion: 0.30, screenSize: GameViewController.screenSize))
                scene.addChild(pauseBackground)
                
                closePause.zPosition = 100
                closePause.position = CGPoint(x: GameViewController.screenSize.width * -0.07, y: GameViewController.screenSize.height * 0.35)
                closePause.scale(to: autoScale(closePause, widthProportion: 0.4, screenSize: pauseBackground.size))
                pauseBackground.addChild(closePause)
                
                resetBattle.zPosition = 100
                resetBattle.position = CGPoint(x: GameViewController.screenSize.width * 0, y: GameViewController.screenSize.height * -0.12)
                resetBattle.scale(to: autoScale(resetBattle, widthProportion: 0.7, screenSize: pauseBackground.size))
                pauseBackground.addChild(resetBattle)
                
                mainMenu.zPosition = 100
                mainMenu.position = CGPoint(x: GameViewController.screenSize.width * 0, y: GameViewController.screenSize.height * -0.27)
                mainMenu.scale(to: autoScale(resetBattle, widthProportion: 0.7, screenSize: pauseBackground.size))
                pauseBackground.addChild(mainMenu)
            } else {
                remove()
                scene.isPaused = false
            }
        }
    }
    
    public func remove() {
        closePause.removeFromParent()
        pauseBackground.removeFromParent()
        resetBattle.removeFromParent()
        mainMenu.removeFromParent()
    }
}
