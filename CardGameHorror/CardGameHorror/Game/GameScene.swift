//
//  GameScene.swift
//  CardGameHorror
//
//  Created by Eduardo on 10/07/23.
//

import SpriteKit
import GameplayKit

protocol endTurnDelegate: AnyObject {
    func handCardsDidFinishAnimating()
}

class GameScene: SKScene, endTurnDelegate {
    var cenario: Cenario?
    // hud
    var hud: Hud?
    // mão das cartas
    var handCards: HandCards!
    // inimigo
    var boss: Boss?
    
    override init(size: CGSize) {
        super.init(size: size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMove(to view: SKView) {
        if GameController.shared.isGameOver() == true{
            GameController.shared.startNewGame()
        }
        setupCenario()
        setupHud()
        setupGameplay()
        setupBoss()
        self.isUserInteractionEnabled = true
    }
    
    private func setupGameplay() {
        // cartas da mão inicial
        let cardsHand = GameController.shared.cardsHandPlayer()
        // configura visualização da mão de cartas
        setupHand(cards: cardsHand)
    }
    
    private func setupHud(){
        hud = Hud()
        addChild(hud!)
        hud!.endTurnButtom.endTurnButtonDelegate = self
    }
    
    private func setupBoss() {
        boss = Boss()
        addChild(boss!)
        boss!.enemyEntity.idle()
    }
    
    private func setupCenario(){
        cenario = Cenario()
        addChild(cenario!)
    }
    
    private func setupHand(cards: [Card]) {
        handCards = HandCards(cards: cards)
        // Defina a posição inicial abaixo da tela
        handCards.name = "handCards"
        handCards.animateEntryHand()
        addChild(handCards)
    }
    
    func handCardsDidFinishAnimating() {
        func clearHead() {
            handCards.cardsModel = []
            GameController.shared.selectedCard = []
            let cardsHand = GameController.shared.cardsHandPlayer()
            setupHand(cards: cardsHand)
        }
        
        handCards.animateExitHand(completion: clearHead)
        //boss animations
        boss!.enemyEntity.takingDamage()
    }
}
