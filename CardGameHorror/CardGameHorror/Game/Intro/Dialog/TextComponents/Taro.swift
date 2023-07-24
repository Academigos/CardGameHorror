//
//  Taro.swift
//  CardGameHorror
//
//  Created by Luiz Felipe on 24/07/23.
//

import SpriteKit

class Taro:SKNode{
    let carta1 = Carta1(carta1: "Carta1")
    let carta2 = Carta2(carta2: "Carta2")
    let carta3 = Carta3(carta3: "Carta3")
    override init() {
        super.init()
        carta1.scale(to: autoScale(carta1, widthProportion: 0.08, screenSize: GameViewController.screenSize))
        carta2.scale(to: autoScale(carta2, widthProportion: 0.08, screenSize: GameViewController.screenSize))
        carta3.scale(to: autoScale(carta3, widthProportion: 0.08, screenSize: GameViewController.screenSize))
        animacaoTaro(carta: carta1, posicao: positionCarta1)
        animacaoTaro(carta: carta2, posicao: positionCarta2)
        animacaoTaro(carta: carta3, posicao: positionCarta3)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let positionCarta1 = CGPoint(x: 328, y: 235)
    let positionCarta2 = CGPoint(x: 417, y: 265)
    let positionCarta3 = CGPoint(x: 506, y: 295)
    
    func animacaoTaro(carta:SKSpriteNode, posicao:CGPoint){
        let delay = SKAction.wait(forDuration: 1)
        let animacaoCarta = SKAction.sequence([SKAction.fadeAlpha(to: 0, duration: 0),delay, SKAction.fadeAlpha(to: 1.0, duration: 2)])
        self.addChild(carta)
        carta.run(animacaoCarta)

        carta.position = posicao
        
    }
}
