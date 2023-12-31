//
//  Fundo.swift
//  CardGameHorror
//
//  Created by Luiz Felipe on 20/07/23.
//

import SpriteKit

class Fundo:SKNode{
    let background = Background(background: "Background")
    let arvoresFundo = ArvoresFundo(arvoresFundo: "Arbustos")
    
//    let carros = Carros()
//    let arvoresFrente = ArvoresFrente(arvoresFrente: "Arvores")
    
    override init() {
        super.init()
        background.zPosition = 0
        arvoresFundo.zPosition=1
        
//        background.scale(to: autoScale(background, widthProportion: 1, screenSize: GameViewController.screenSize))
//        arvoresFundo.scale(to: autoScale(arvoresFundo, widthProportion: 1, screenSize: GameViewController.screenSize))
//        estrada.scale(to: autoScale(estrada, widthProportion: 1, screenSize: GameViewController.screenSize))
        
        background.position = CGPoint(x: 0, y: 0)
        arvoresFundo.position = CGPoint(x: 0, y: 0)
        
    
        addChild(background)
        addChild(arvoresFundo)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
