//
//  LifeBarBackGround.swift
//  CardGameHorror
//
//  Created by Eduardo on 19/07/23.
//

import Foundation
import SpriteKit

class LifeBarBackGround: SKSpriteNode{
    let BackGroundTexture: SKTexture = SKTexture(imageNamed: "LifeBarBackGround")
    init() {
        super.init(texture: BackGroundTexture, color: .clear, size: BackGroundTexture.size())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
