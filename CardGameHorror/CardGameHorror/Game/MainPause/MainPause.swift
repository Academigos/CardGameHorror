//
//  MainPause.swift
//  CardGameHorror
//
//  Created by Eduardo on 25/07/23.
//

import Foundation
import SpriteKit

class MainPause: SKNode{
    
    
    init(isIntro: Bool) {
        let PauseButtom = MainPauseButtom(isIntro: isIntro, currentScene: "MainMenu")
        super.init()
        PauseButtom.zPosition = 5
        PauseButtom.position = CGPoint(x: GameViewController.screenSize.width * 0.90, y: GameViewController.screenSize.height * 0.90)
        addChild(PauseButtom)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
