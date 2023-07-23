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
    var fumaca:SKEmitterNode! = SKEmitterNode(fileNamed: "Fumaca")
    
    override init() {
        super.init()
        carro1.zPosition = 0
        carro2.zPosition = 1
        farol.zPosition = 2
        fumaca.zPosition = 2
        
//        farol.position = CGPoint(x: 0, y: 0)
//        carro1.scale(to: autoScale(carro1, widthProportion: 1, screenSize: GameViewController.screenSize))
        //farol.scale(to: autoScale(farol, widthProportion: , screenSize: GameViewController.screenSize))
//        carro2.scale(to: autoScale(carro2, widthProportion: 1, screenSize: GameViewController.screenSize))
        addChild(carro1)
        addChild(carro2)
        addChild(farol)
        criarFumaca()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func criarFumaca(){
        
        fumaca?.position = CGPoint(x: -140, y: -35)
        fumaca?.particleSize = CGSize(width: GameViewController.screenSize.width*0.1 , height: GameViewController.screenSize.height*0.1)
//        var efeito = SKAction(named: "FadeIn") ?? SKAction()
//        fumaca!.run(efeito)
        self.addChild(fumaca!)
        
    }
    
}
