//
//  GameScene.swift
//  CardGameHorror
//
//  Created by Eduardo on 10/07/23.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    let hud = Hud()
    override func didMove(to view: SKView) {
        GameController.shared.startNewGame()
        addChild(hud)
    }
}
