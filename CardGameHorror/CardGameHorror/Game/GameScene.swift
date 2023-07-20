//
//  GameScene.swift
//  CardGameHorror
//
//  Created by Eduardo on 10/07/23.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    let boss = Boss()
    override func didMove(to view: SKView) {
    
        addChild(boss)
        boss.enemyEntity.startRotationAnimation()
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            guard let touch = touches.first else { return }
            let touchLocation = touch.location(in: self)
            
            if boss.contains(touchLocation) {
                boss.enemyEntity.takingDamage()
            }
        }
}
