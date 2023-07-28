//
//  Eduardo.swift
//  CardGameHorror
//
//  Created by Eduardo on 28/07/23.
//

import Foundation
import SpriteKit

class Eduardo: SKSpriteNode{
    let eduardo: SKTexture
    
    init(){
        self.eduardo = SKTexture(imageNamed: "CreditosEduardo")
        super.init(texture: eduardo, color: .clear, size: eduardo.size())
        self.scale(to: autoScale(self, widthProportion: 0.22, screenSize: GameViewController.screenSize))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
