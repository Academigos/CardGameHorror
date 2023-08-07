//
//  Mao2.swift
//  CardGameHorror
//
//  Created by Luiz Felipe on 24/07/23.
//

import SpriteKit

///Classe para definir a textura da mão
class Mao2: SKSpriteNode{
    let mao2 : SKTexture
    
    init(mao2: String) {
        self.mao2 = SKTexture(imageNamed: mao2)
        super.init(texture: self.mao2, color: .clear, size: self.mao2.size())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
