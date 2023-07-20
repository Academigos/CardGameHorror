//
//  GameScene.swift
//  CardGameHorror
//
//  Created by Eduardo on 10/07/23.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    // hud
    let hud = Hud()
    
    // mão das cartas
    let handCards: HandCards
    
    override init(size: CGSize) {
        handCards = HandCards(cardCount: 5)
        super.init(size: size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMove(to view: SKView) {
        GameController.shared.startNewGame()
        setupHud()
        setupHand()
        self.isUserInteractionEnabled = true
    }
    
    private func setupHud(){
        addChild(hud)
    }
    
    private func setupHand() {
        // Defina a posição inicial abaixo da tela
        handCards.position = CGPoint(x: GameViewController.screenSize.width * 0.5, y: -handCards.size.height)
        let finalPosition = CGPoint(x: GameViewController.screenSize.width * 0.5, y: handCards.size.height * 0.4)

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
