//
//  DialogComponents.swift
//  CardGameHorror
//
//  Created by Giovanni Favorin de Melo on 23/07/23.
//

import SpriteKit

enum BackgroundType: Int {
    case desk
    case room
}

///Classe para gerir o cenário da introdução 
class IntroScenary: SKSpriteNode {
    let backgroundType: BackgroundType
    let scenaryTexture: SKTexture

    required init?(coder aDecoder: NSCoder) {
        fatalError("NSCoding not supported")
    }

    init(backgroundType: BackgroundType) {
        self.backgroundType = backgroundType
        
        switch backgroundType {
        case .desk:
            scenaryTexture = SKTexture(imageNamed: "desk")
        case .room:
            scenaryTexture = SKTexture(imageNamed: "room")
        }
        
        super.init(texture: scenaryTexture, color: UIColor.clear, size: scenaryTexture.size())
        self.position = CGPoint(x: GameViewController.screenSize.width * 0.5, y: GameViewController.screenSize.height * 0.5)
        
        if GameController.shared.getDeviceModel() == "iPhone SE" || GameController.shared.getDeviceModel() == "iPhone 8" || GameController.shared.getDeviceModel() == "iPhone x" || GameController.shared.getDeviceModel() == "iPhone 12"{
            if let currentScene = self.scene {
                currentScene.scaleMode = .aspectFit
            }
        }else{
            self.scale(to: GameViewController.screenSize)
        }
        zPosition = -1
    }
}
