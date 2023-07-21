//
//  Languages.swift
//  CardGameHorror
//
//  Created by Eduardo on 21/07/23.
//

import Foundation
import SpriteKit

class Languages: SKSpriteNode{
    let languages: SKTexture
    
    init() {
        self.languages = SKTexture(imageNamed: "Langueges")
        super.init(texture: languages, color: .clear, size: languages.size())
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
