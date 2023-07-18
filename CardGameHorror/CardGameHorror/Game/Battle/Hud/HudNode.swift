//
//  HudNode.swift
//  CardGameHorror
//
//  Created by Eduardo on 18/07/23.
//

import Foundation
import SpriteKit

class Hud: SKNode {
    let DownBar = SpriteStatic(texture: "Barra Inferior")
    
    override init() {
        super.init()
        
        // Add the DownBar node as a child to the Hud node
        DownBar.position = CGPoint(x: GameViewController.screenSize.width * 0.5 , y: GameViewController.screenSize.height * 0.1)
        DownBar.scale(to: autoScale(DownBar, widthProportion: 1, screenSize: GameViewController.screenSize))
        addChild(DownBar)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
