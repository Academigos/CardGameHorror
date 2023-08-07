//
//  Taro.swift
//  CardGameHorror
//
//  Created by Luiz Felipe on 24/07/23.
//

import SpriteKit

enum CartaIntroType: Int {
    case carta1
    case carta2
    case carta3
}

///Classe para controlar o posicionamento e animação das cartas
class Taro: SKSpriteNode{
    let carta:CartaIntroType
    let cardSongIntro = SKAudioNode(fileNamed: "carta_virando_sfx")
    
    init(carta: CartaIntroType) {
        self.carta = carta
        let cartaTexture: SKTexture
        
        switch carta {
        case .carta1:
            cartaTexture = SKTexture(imageNamed: "Carta1")
        case .carta2:
            cartaTexture = SKTexture(imageNamed: "Carta2")
        case .carta3:
            cartaTexture = SKTexture(imageNamed: "Carta3")
        }
        
        super.init(texture: cartaTexture, color: UIColor.clear, size: cartaTexture.size())
        zPosition = 2
        self.scale(to: autoScale(self, widthProportion: 0.08, screenSize: GameViewController.screenSize))
        switch carta {
        case .carta1:
            animacaoTaro(carta: self, posicao: positionCarta1)
        case .carta2:
            animacaoTaro(carta: self, posicao: positionCarta2)
        case .carta3:
            animacaoTaro(carta: self, posicao: positionCarta3)
        }
        
        //adiciona o audio
        cardSongIntro.autoplayLooped = false
        self.addChild(cardSongIntro)
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //posição das cartas
    let positionCarta1 = CGPoint(x: GameViewController.screenSize.width * 0.388, y: GameViewController.screenSize.height * 0.6)
    let positionCarta2 = CGPoint(x: GameViewController.screenSize.width * 0.49, y: GameViewController.screenSize.height * 0.67)
    let positionCarta3 = CGPoint(x: GameViewController.screenSize.width * 0.59, y: GameViewController.screenSize.height * 0.756)
    
    ///animação das cartas
    func animacaoTaro(carta:SKSpriteNode, posicao:CGPoint){
        let delay = SKAction.wait(forDuration: 0.4)
        let animacaoCarta = SKAction.sequence([SKAction.fadeAlpha(to: 0, duration: 0),delay, SKAction.fadeAlpha(to: 1.0, duration: 0.5)])
        carta.run(animacaoCarta)
        cardSongIntro.run(SKAction.play())
        carta.position = posicao
    }
}
