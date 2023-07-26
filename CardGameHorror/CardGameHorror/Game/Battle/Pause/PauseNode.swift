//
//  PauseNode.swift
//  CardGameHorror
//
//  Created by Eduardo on 21/07/23.
//

import Foundation
import SpriteKit

class PauseNode: SKNode{
    let pauseButtom = PauseButtom(currentScene: "GameScene")
    
    override init() {
        super.init()
        pauseButtom.position = CGPoint(x: GameViewController.screenSize.width * 0.92, y: GameViewController.screenSize.height * 0.883)
        addChild(pauseButtom)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
