//
//  Carros.swift
//  CardGameHorror
//
//  Created by Luiz Felipe on 20/07/23.
//


import SpriteKit
import GameplayKit
class Carros: SKNode{
    let carro1  = Carro1(carro1: "Carro1")
    let carro2  = Carro2(carro2: "Carro2")
    let farol = Farol()
    
    override init() {
        super.init()
//        carro1.scale(to: autoScale(carro1, widthProportion: 1, screenSize: GameViewController.screenSize))
        farol.scale(to: autoScale(farol, widthProportion: 0.01, screenSize: GameViewController.screenSize))
//        carro2.scale(to: autoScale(carro2, widthProportion: 1, screenSize: GameViewController.screenSize))
        addChild(carro1)
        addChild(farol)
        addChild(carro2)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
