//
//  Carros.swift
//  CardGameHorror
//
//  Created by Luiz Felipe on 20/07/23.
//

import SpriteKit
import GameplayKit

///Classe para definir o comportamento do carro no cenário
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
        
        addChild(carro1)
        addChild(carro2)
        addChild(farol)
        criarFumaca()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    ///define o posicionamento e comportamento da fumaça
    func criarFumaca(){
        fumaca?.position = CGPoint(x: -140, y: -35)
        fumaca?.particleSize = CGSize(width: GameViewController.screenSize.width*0.1 , height: GameViewController.screenSize.height*0.1)
        self.addChild(fumaca!)
        
    }
    
}
