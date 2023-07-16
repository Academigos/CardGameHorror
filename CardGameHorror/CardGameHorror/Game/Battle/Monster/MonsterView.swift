//
//  MonsterView.swift
//  CardGameHorror
//
//  Created by Giovanni Favorin de Melo on 15/07/23.
//

import SpriteKit

class MonsterView: SKScene {

    override func didMove(to view: SKView) {
        let monstro = Monster(monsterType: .initial)
        monstro.position = CGPoint(x: size.width * 0.5, y: size.height * 0.5)
        addChild(monstro)
    }
}
