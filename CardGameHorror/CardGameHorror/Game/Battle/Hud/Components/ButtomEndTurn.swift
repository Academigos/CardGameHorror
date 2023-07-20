//
//  buttomSprite.swift
//  CardGameHorror
//
//  Created by Eduardo on 19/07/23.
//

import Foundation
import SpriteKit
class ButtonEndTurn: SKSpriteNode{
    
    let buttomTexture: SKTexture
    init(buttomTexture: String) {
        self.buttomTexture = SKTexture(imageNamed: buttomTexture)
        
        let cards = DataManager.shared.fetchCardPlayer()
        let cardsSelected = Array(cards.prefix(3))
        for card in cardsSelected{
            GameController.shared.addToSelectedCards(selectedCard: card)
        }
        
        super.init(texture: self.buttomTexture, color: .clear, size: self.buttomTexture.size())
        isUserInteractionEnabled = true
        if GameController.shared.selectedCard.count < 3 {
            alpha = 0.5
        }
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if GameController.shared.isGameOver() == false && GameController.shared.selectedCard.count == 3{
            
            let selectedCards = Set(GameController.shared.selectedCard)
            
            GameController.shared.processSelectedCards(selectedCards: selectedCards)
            GameController.shared.playerTurn()
            GameController.shared.monsterTurn()
            if let hud = parent as? Hud {
                hud.updateLife(DataManager.shared.fetchPlayer().hp, DataManager.shared.fetchMonster().hp)
            }
        }else if GameController.shared.isGameOver() == true{
            print("bla")
        }else{
            let impactFeedbackGenerator = UIImpactFeedbackGenerator(style: .heavy)
            impactFeedbackGenerator.prepare()
            impactFeedbackGenerator.impactOccurred()
        }
    }
    func updateOpacity() {
        if GameController.shared.selectedCard.count < 3 {
            alpha = 0.5
        } else {
            alpha = 1.0
        }
    }
}
