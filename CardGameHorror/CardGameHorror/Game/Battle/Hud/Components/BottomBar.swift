//
//  BottemBar.swift
//  CardGameHorror
//
//  Created by Eduardo on 18/07/23.
//

import Foundation
import SpriteKit

class BottomBar: SKSpriteNode{
    let bottomBarTexture: SKTexture
    init() {
        self.bottomBarTexture = SKTexture(imageNamed: "BottomBar")
        super.init(texture: bottomBarTexture, color: .clear , size: bottomBarTexture.size())
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
