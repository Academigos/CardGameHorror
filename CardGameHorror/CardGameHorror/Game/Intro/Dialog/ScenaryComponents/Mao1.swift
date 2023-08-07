//
//  Mao1.swift
//  CardGameHorror
//
//  Created by Luiz Felipe on 24/07/23.
//
import SpriteKit

///Classe para definir a textura da mão
class Mao1: SKSpriteNode{
    let mao1 : SKTexture
    
    init(mao1: String) {
        self.mao1 = SKTexture(imageNamed: mao1)
        super.init(texture: self.mao1, color: .clear, size: self.mao1.size())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
