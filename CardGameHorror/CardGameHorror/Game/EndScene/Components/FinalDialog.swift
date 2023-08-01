//
//  FinalDialog.swift
//  CardGameHorror
//
//  Created by Luiz Felipe on 01/08/23.
//

import SpriteKit

class FinalDialog:SKSpriteNode{
    let finalDialog:SKTexture
    
    init(finalDialog: String) {
        self.finalDialog = SKTexture(imageNamed: finalDialog)
        super.init(texture: self.finalDialog, color: .clear, size: self.finalDialog.size())
        self.scale(to: GameViewController.screenSize)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
