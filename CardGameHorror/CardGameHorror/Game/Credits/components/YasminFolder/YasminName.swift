//
//  Yasmin.swift
//  CardGameHorror
//
//  Created by Eduardo on 28/07/23.
//

import Foundation
import SpriteKit

class YasminName: SKSpriteNode{
    let yasmin: SKTexture
    
    init() {
        self.yasmin = SKTexture(imageNamed: "CreditosYasmin")
        super.init(texture: yasmin, color: .clear, size: yasmin.size())
        self.scale(to: autoScale(self, widthProportion: 0.17, screenSize: GameViewController.screenSize))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
