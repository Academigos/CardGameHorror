//
//  PauseBackground.swift
//  CardGameHorror
//
//  Created by Eduardo on 21/07/23.
//

import Foundation
import SpriteKit


class PauseBackground: SKSpriteNode{
     let pauseBackGround: SKTexture
    weak var delegate: ClosePauseDelegate?

    
    init() {
        self.pauseBackGround = SKTexture(imageNamed: "PauseBackground")
        super.init(texture: pauseBackGround, color: .clear, size: pauseBackGround.size())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
