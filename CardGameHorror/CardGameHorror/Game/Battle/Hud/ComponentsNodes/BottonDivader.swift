//
//  BottonDivader.swift
//  CardGameHorror
//
//  Created by Eduardo on 19/07/23.
//

import Foundation
import SpriteKit

class BottomDivader: SKNode{
    let playerHud = PlayerHud()
    let endTurnButtom = ButtonEndTurn(buttomTexture: "EndTurn")
    override init() {
        super.init()
        
        endTurnButtom.position = CGPoint(x: GameViewController.screenSize.width * 0.85, y: GameViewController.screenSize.height * 0.18)
        endTurnButtom.scale(to: autoScale(endTurnButtom, widthProportion: 0.14, screenSize: GameViewController.screenSize))
        endTurnButtom.zPosition = 10
        addChild(endTurnButtom)
        
        playerHud.zPosition = 10
        addChild(playerHud)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
