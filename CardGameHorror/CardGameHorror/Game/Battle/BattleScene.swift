//
//  GameScene.swift
//  CardGameHorror
//
//  Created by Eduardo on 10/07/23.
//

import SpriteKit
import GameplayKit

class BattleScene: SKScene {
    // mão das cartas
    let handCards: HandCards
    
    override init(size: CGSize) {
        handCards = HandCards(sizeScreen: size, cardCount: 5)
        super.init(size: size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMove(to view: SKView) {
        setupHand()
        self.isUserInteractionEnabled = true
    }
    
    private func setupHand() {
        // Defina a posição inicial abaixo da tela
        handCards.position = CGPoint(x: size.width / 2, y: -handCards.size.height)

        let finalPosition = CGPoint(x: size.width / 2, y: handCards.size.height / 3)

        // Crie uma ação para mover o nó de sua posição inicial até a posição final
        let moveAction = SKAction.moveTo(y: finalPosition.y, duration: 1.0)

        // Adicione uma ação de bloqueio para manter o nó na posição final
        let holdAction = SKAction.wait(forDuration: 0.5)

        // Combine as ações em uma sequência
        let sequence = SKAction.sequence([moveAction, holdAction])

        handCards.run(sequence)
        
        addChild(handCards)
    }
}
