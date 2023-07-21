//
//  Estrada.swift
//  CardGameHorror
//
//  Created by Luiz Felipe on 20/07/23.
//

import SpriteKit

class Estrada: SKSpriteNode{
    let estrada : SKTexture
    
    init(estrada: String) {
        self.estrada = SKTexture(imageNamed: estrada)
        super.init(texture: self.estrada, color: .clear, size: self.estrada.size())
        self.scale(to: autoScale(self, widthProportion: 1, screenSize: GameViewController.screenSize))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
