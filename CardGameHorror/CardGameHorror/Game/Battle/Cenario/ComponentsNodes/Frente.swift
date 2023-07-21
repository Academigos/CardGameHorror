//
//  Frente.swift
//  CardGameHorror
//
//  Created by Luiz Felipe on 20/07/23.
//

import SpriteKit

class Frente:SKNode{

    let arvoresFrente = ArvoresFrente(arvoresFrente: "Arvores")
    
    override init() {
        super.init()
//        arvoresFrente.scale(to: autoScale(arvoresFrente, widthProportion: 1, screenSize: GameViewController.screenSize))
//        
//        arvoresFrente.position = CGPoint(x: GameViewController.screenSize.width*0.5, y: GameViewController.screenSize.height*0.5)
        
        addChild(arvoresFrente)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
