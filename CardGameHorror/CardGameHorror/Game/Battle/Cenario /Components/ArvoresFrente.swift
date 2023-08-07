//
//  ArvoresFrente.swift
//  CardGameHorror
//
//  Created by Luiz Felipe on 20/07/23.
//

import SpriteKit

///Define textura das árvores
class ArvoresFrente: SKSpriteNode {
    let arvoresFrente : SKTexture
    
    init(arvoresFrente: String) {
        self.arvoresFrente = SKTexture(imageNamed: arvoresFrente)
        super.init(texture: self.arvoresFrente, color: .clear, size: self.arvoresFrente.size())
        self.scale(to: GameViewController.screenSize)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
