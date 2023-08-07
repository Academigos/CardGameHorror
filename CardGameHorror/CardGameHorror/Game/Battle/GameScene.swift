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

///Classe para controlar a cena de combate
class GameScene: SKScene, endTurnDelegate, ResetBattleDelegate {
    var cenario: Cenario?
    // hud
    var hud: Hud?
    // mão das cartas
    var handCards: HandCards!
    // inimigo
    var boss: Boss?
    
    var dialogView: DialogView? = DialogView()
    
    var monsterEntry: MonsterEntry = MonsterEntry()
    
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
        setupBoss()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            self.setupHud()
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
            self.setupGameplay()
        }

        self.isUserInteractionEnabled = true
    }
    
    //Inicializa as cartas no início do jogo
    private func setupGameplay() {
        // cartas da mão inicial
        let cardsHand = GameController.shared.cardsHandPlayer()
        // configura visualização da mão de cartas
        setupHand(cards: cardsHand)
    }
    
    //incializa o HUD
    private func setupHud(){
        hud = Hud()
        addChild(hud!)
        hud!.endTurnButtom.endTurnButtonDelegate = self
        hud!.pause.pauseButtom.resetBattle.resetDelegate = self
        
        hud!.alpha = 0.0
        let fadeInAction = SKAction.fadeIn(withDuration: 1.5)

        hud!.run(fadeInAction)
    }
    
    //inicializa o oponente
    private func setupBoss() {
        boss = Boss()
        addChild(monsterEntry)
        addChild(boss!)
        boss!.enemyEntity.scale(to: autoScale( boss!.enemyEntity, widthProportion: 0.19, screenSize: GameViewController.screenSize))
        boss!.enemyEntity.fadeIn()
        boss!.enemyEntity.idle()
    }
    
    //inicializa o cenário
    private func setupCenario(){
        cenario = Cenario()
        addChild(cenario!)
    }
    
    //recarrega as cartas a cada turno
    private func setupHand(cards: [Card]) {
        handCards = HandCards(cards: cards)
        // Defina a posição inicial abaixo da tela
        handCards.name = "handCards"
        handCards.animateEntryHand()
        addChild(handCards)
    }
    
    // animação cartas final de turno
    func handCardsDidFinishAnimating() {
        // sair hand animação
        handCards.animateExitHand(completion: clearHand)
        //boss animations
        boss!.enemyEntity.takingDamage()
    }
    
    // Limpa a mão e reseta com atraso por conta do delay da animação do monstro
    func clearHand() {
        let atraso: Double = 4.0
        handCards.cardsModel = []
        GameController.shared.selectedCard = []
        let cardsHand = GameController.shared.cardsHandPlayer()
        // Configure o despacho assíncrono após o atraso
        DispatchQueue.main.asyncAfter(deadline: .now() + atraso) {
            if DataManager.shared.fetchPlayer().hp <= 0 {
                return
            }
            self.setupHand(cards: cardsHand)
        }
    }
    
    // reseta batalha
    func resetButtonTapped() {
        handCards.cardsModel = []
        GameController.shared.selectedCard = []
        handCards.animateExitHand(completion: self.setupGameplay)
        hud!.resetLife()
    }
}
