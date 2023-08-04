//
//  MainPause.swift
//  CardGameHorror
//
//  Created by Eduardo on 25/07/23.
//

import SpriteKit

/// Classe que define reúne todos os componentes do elemento pausa
class MainPause: SKNode{
    
    init(isIntro: Bool, currentScene: String) {
        let PauseButtom = MainPauseButtom(isIntro: isIntro, currentScene: currentScene)
        super.init()
        PauseButtom.zPosition = 5
        PauseButtom.position = CGPoint(x: GameViewController.screenSize.width * 0.90, y: GameViewController.screenSize.height * 0.90)
        addChild(PauseButtom)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
