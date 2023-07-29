//
//  CreditsDivider.swift
//  CardGameHorror
//
//  Created by Eduardo on 28/07/23.
//

import Foundation
import SpriteKit

class CreditsDivider: SKSpriteNode{
    let creditsDivider: SKTexture
    init() {
        self.creditsDivider = SKTexture(imageNamed: "CreditsDivider")
        super.init(texture: creditsDivider, color: .clear, size: creditsDivider.size())
        self.scale(to: autoScale(self, widthProportion: 0.20, screenSize: GameViewController.screenSize))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
