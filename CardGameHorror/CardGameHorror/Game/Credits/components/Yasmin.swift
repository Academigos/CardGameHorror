//
//  Yasmin.swift
//  CardGameHorror
//
//  Created by Eduardo on 28/07/23.
//

import Foundation
import SpriteKit

/// Classe responsável por tratar o node de créditos da Yasmin
class Yasmin: SKNode {
    let insta = YasminInsta()
    let behance = YasminBe()
    let yasmin = YasminName()
    override init() {
        super.init()

        yasmin.position = CGPoint(x: GameViewController.screenSize.width * 0.25, y: GameViewController.screenSize.height * 0.62)
        behance.position = CGPoint(x: GameViewController.screenSize.width * 0.38, y: GameViewController.screenSize.height * 0.62)
        insta.position = CGPoint(x: GameViewController.screenSize.width * 0.43, y: GameViewController.screenSize.height * 0.62)
        
        addChild(yasmin)
        addChild(behance)
        addChild(insta)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
