//
//  NamePlaceHolder.swift
//  CardGameHorror
//
//  Created by Eduardo on 19/07/23.
//

import Foundation
import SpriteKit

class NamePlaceHolder: SKSpriteNode {
    let textureName: SKTexture
    
    init(texture: String) {
        self.textureName = SKTexture(imageNamed: texture)
        super.init(texture: textureName, color: .clear, size: textureName.size())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
