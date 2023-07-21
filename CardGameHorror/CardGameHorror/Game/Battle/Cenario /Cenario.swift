//
//  Cenario.swift
//  CardGameHorror
//
//  Created by Luiz Felipe on 20/07/23.
//

import Foundation
import SpriteKit

class Cenario:SKNode{
    let fundo = Fundo()
    let carro = Carros()
    let frente = Frente()
    
    override init(){
        super.init()
        
        fundo.position = CGPoint(x: GameViewController.screenSize.width*0.5, y: GameViewController.screenSize.height*0.5)
        carro.position = CGPoint(x: GameViewController.screenSize.width*0.5, y: GameViewController.screenSize.height*0.5)
        frente.position = CGPoint(x: GameViewController.screenSize.width*0.5, y: GameViewController.screenSize.height*0.5)
        
        fundo.zPosition = -10
        carro.zPosition = -9
        frente.zPosition = -7
        
        addChild(fundo)
        addChild(carro)
        addChild(frente)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
