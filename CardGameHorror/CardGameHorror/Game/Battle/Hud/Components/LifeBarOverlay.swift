//
//  LifeBarOverlay.swift
//  CardGameHorror
//
//  Created by Eduardo on 23/07/23.
//

import Foundation
import SpriteKit

///Sobreposição da barra de vida
class LifeBarOverlay: SKSpriteNode {
    let lifeBarOverlay: SKTexture
    
    init() {
        self.lifeBarOverlay = SKTexture(imageNamed: "LifeBarOverlay")
        super.init(texture: lifeBarOverlay, color: .clear, size: lifeBarOverlay.size())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
