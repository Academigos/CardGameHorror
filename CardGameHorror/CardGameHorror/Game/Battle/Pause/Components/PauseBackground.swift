//
//  PauseBackground.swift
//  CardGameHorror
//
//  Created by Eduardo on 19/07/23.
//

import Foundation
import SpriteKit

class PauseBackGround: SKSpriteNode{
    let pauseBackGround: SKTexture
    
    init(pauseBackground: String) {
        self.pauseBackGround = SKTexture(imageNamed: pauseBackground)
        super.init(texture: self.pauseBackGround, color: .clear, size: self.pauseBackGround.size())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
