//
//  PauseButtom.swift
//  CardGameHorror
//
//  Created by Eduardo on 19/07/23.
//

import Foundation
import SpriteKit

class PauseMenu: SKSpriteNode{
    let pauseTexture: SKTexture
    
    init() {
        self.pauseTexture = SKTexture(imageNamed: "PauseBackground")
        super.init(texture: self.pauseTexture, color: .clear, size: self.pauseTexture.size())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
}
