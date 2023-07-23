//
//  DialogView.swift
//  CardGameHorror
//
//  Created by Giovanni Favorin de Melo on 23/07/23.
//

import SpriteKit

class DialogView: SKNode {
    let firstScenary = IntroScenary(backgroundType: .desk)
    
    override init() {
        super.init()
        
        firstScenary.position = CGPoint(x: GameViewController.screenSize.width * 0.5, y: GameViewController.screenSize.height * 0.5)
        firstScenary.scale(to: autoScale(firstScenary, widthProportion: 0.14, screenSize: GameViewController.screenSize))
        addChild(firstScenary)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
