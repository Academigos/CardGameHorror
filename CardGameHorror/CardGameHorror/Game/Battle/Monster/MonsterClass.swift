//
//  MonsterClass.swift
//  CardGameHorror
//
//  Created by Giovanni Favorin de Melo on 15/07/23.
//

import SpriteKit

enum MonsterType :Int {
  case initial
}

class Monster: SKSpriteNode {
    let monsterType: MonsterType
    let monsterTexture: SKTexture
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("NSCoding not supported")
    }

    init(monsterType: MonsterType) {
        self.monsterType = monsterType
        
        monsterTexture = SKTexture(imageNamed: "Monstro")
        
//        switch monsterType {
//        case .initial:
//            monsterTexture = SKTexture(imageNamed: "Monstro")
//        }

        super.init(texture: monsterTexture, color: UIColor.clear, size: monsterTexture.size())
    }
}
