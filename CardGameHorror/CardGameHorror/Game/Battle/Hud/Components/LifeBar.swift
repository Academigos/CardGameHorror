//
//  PlayerLifeBar.swift
//  CardGameHorror
//
//  Created by Eduardo on 18/07/23.
//

import Foundation
import SpriteKit

class LifeBar: SKSpriteNode {
    let lifeBarTexture: SKTexture
    
    init(lifeBarTexture: String) {
        self.lifeBarTexture = SKTexture(imageNamed: lifeBarTexture)
        super.init(texture: self.lifeBarTexture, color: .clear, size: self.lifeBarTexture.size())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

