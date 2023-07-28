//
//  ResetButton.swift
//  CardGameHorror
//
//  Created by Luiz Felipe on 28/07/23.
//

import SpriteKit

class ResetButton : SKNode{
    
    let resetButton = FinalButton(finalButton: "BotaoReset")
    let nome = SKLabelNode(text: "Inicio")
    
    override init() {
        super.init()
        addChild(resetButton)
        addChild(nome)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
