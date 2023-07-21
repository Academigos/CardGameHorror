//
//  ArvoresFundo.swift
//  CardGameHorror
//
//  Created by Luiz Felipe on 20/07/23.
//

import SpriteKit

class ArvoresFundo: SKSpriteNode{
    let arvoresFundo : SKTexture
    
    init(arvoresFundo: String) {
        self.arvoresFundo = SKTexture(imageNamed: arvoresFundo)
        super.init(texture: self.arvoresFundo, color: .clear, size: self.arvoresFundo.size())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
