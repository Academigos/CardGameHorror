//
//  BackgroundFinalBattle.swift
//  CardGameHorror
//
//  Created by Luiz Felipe on 25/07/23.
//

import SpriteKit

class BackgroundFinalBattle: SKSpriteNode{
    let backgroundFinalBattle : SKTexture
    
    init(backgroundFinalBattle: String) {
        self.backgroundFinalBattle = SKTexture(imageNamed: backgroundFinalBattle)
        super.init(texture: self.backgroundFinalBattle, color: .clear, size: self.backgroundFinalBattle.size())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
