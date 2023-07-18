//
//  GameScene.swift
//  CardGameHorror
//
//  Created by Eduardo on 10/07/23.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    override func didMove(to view: SKView) {
        let monstro = Monster(monsterType: .initial)
        monstro.position = CGPoint(x: size.width * 0.5, y: size.height * 0.5)
        addChild(monstro)
    }
}
