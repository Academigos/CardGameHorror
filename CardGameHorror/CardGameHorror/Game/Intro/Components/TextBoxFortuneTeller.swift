//
//  TextBoxFortuneTeller.swift
//  CardGameHorror
//
//  Created by Erick Ribeiro on 23/07/23.
//

import SpriteKit

class TextBoxFortuneTeller: SKSpriteNode{
    
    let backgroundTexture: SKTexture
    
    init() {
        self.backgroundTexture = SKTexture(imageNamed: "textbox_cartomante")
        super.init(texture: backgroundTexture, color: .clear, size: backgroundTexture.size())
        
        self.position = CGPoint(x: GameViewController.screenSize.width*0.5, y: GameViewController.screenSize.height*0.5)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
