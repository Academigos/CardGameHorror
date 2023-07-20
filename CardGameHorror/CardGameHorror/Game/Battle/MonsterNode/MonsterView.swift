//
//  MonsterNode.swift
//  CardGameHorror
//
//  Created by Giovanni Favorin de Melo on 18/07/23.
//

import SpriteKit

class Boss: SKNode {
    let enemyEntity = Enemy()
    
    override init() {
        super.init()
        
        enemyEntity.position = CGPoint(x: GameViewController.screenSize.width * 0.5, y: GameViewController.screenSize.height * 0.5)
        addChild(enemyEntity)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
