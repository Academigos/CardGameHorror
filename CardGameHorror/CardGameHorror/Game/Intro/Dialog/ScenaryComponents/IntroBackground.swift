//
//  DialogComponents.swift
//  CardGameHorror
//
//  Created by Giovanni Favorin de Melo on 23/07/23.
//

import SpriteKit

enum BackgroundType: Int {
    case desk,
    room
}

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
        self.scale(to: autoScale(self, widthProportion: 1, screenSize: GameViewController.screenSize))
        zPosition = 1
    }
}
