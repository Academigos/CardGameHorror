//
//  DownBar.swift
//  CardGameHorror
//
//  Created by Eduardo on 18/07/23.
//

import Foundation
import SpriteKit

class SpriteStatic: SKSpriteNode{
    let DownTexture: SKTexture
    init(texture: String) {
        self.DownTexture = SKTexture(imageNamed: texture)
        super.init(texture: DownTexture, color: .clear , size: DownTexture.size())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
