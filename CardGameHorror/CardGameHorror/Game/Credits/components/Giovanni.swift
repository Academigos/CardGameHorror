//
//  Giovenni.swift
//  CardGameHorror
//
//  Created by Eduardo on 28/07/23.
//

import Foundation
import SpriteKit

class Giovanni: SKSpriteNode{
    let giovanni: SKTexture
    
    init(){
        self.giovanni = SKTexture(imageNamed: "CreditosGiovanni")
        super.init(texture: giovanni, color: .clear, size: giovanni.size())
        self.scale(to: autoScale(self, widthProportion: 0.22, screenSize: GameViewController.screenSize))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
