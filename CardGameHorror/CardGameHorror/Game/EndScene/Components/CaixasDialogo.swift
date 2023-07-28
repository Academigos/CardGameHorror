//
//  CaixasDialogo.swift
//  CardGameHorror
//
//  Created by Luiz Felipe on 26/07/23.
//

import SpriteKit

class CaixasDialogo:SKSpriteNode{
    let caixasDialogo : SKTexture
    
    init(caixasDialogo: String) {
        self.caixasDialogo = SKTexture(imageNamed: caixasDialogo)
        super.init(texture: self.caixasDialogo, color: .clear, size: self.caixasDialogo.size())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
