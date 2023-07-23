//
//  TextBoxCayla.swift
//  CardGameHorror
//
//  Created by Erick Ribeiro on 23/07/23.
//

import SpriteKit

class TextBoxCayla: SKSpriteNode{
    
    let texBoxTexture: SKTexture
    
    init() {
        self.texBoxTexture = SKTexture(imageNamed: "textbox_cayla")
        super.init(texture: texBoxTexture, color: .clear, size: texBoxTexture.size())
        
        self.position = CGPoint(x: GameViewController.screenSize.width*0.5, y: GameViewController.screenSize.height*0.31)
        
        self.scale(to: autoScale(self, widthProportion: 0.909, screenSize: GameViewController.screenSize))
        
        zPosition = 2
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
