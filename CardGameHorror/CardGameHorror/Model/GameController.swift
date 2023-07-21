//
// GameController.swift
//  CardGameHorror
//
//  Created by Eduardo on 14/07/23.
//

import Foundation
import CoreData
import GameplayKit

class GameController: NSObject {
    static let shared = GameController()
    private let dataManager = DataManager.shared
    
    private let randomCardCount = 6
    let playerLife: Double = 30
    let monsterLife: Double = 50
    @objc dynamic var selectedCard: [Card] = []
    // MARK: - Game Actions
    
    // Function to start a new game
    func startNewGame() {
        dataManager.updatePlayerHP(value: playerLife) // Reset player's health points
        dataManager.updateMonsterHP(value: monsterLife) // Reset monster's health points
        dataManager.createInitialCardsIfNeeded() // Reset the initial cards
        replacePlayerHand()
    }
    
    // Function to draw cards for the player's initial hand
    
    func cardsHandPlayer() -> [Card] {
        return dataManager.fetchCardPlayer()
    }

    
    private func replacePlayerHand() {
        let player = dataManager.fetchPlayer()
        let allCards = dataManager.fetchCard()
        let selectedCards = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: allCards) as! [Card]
        let firstFiveCards = Array(selectedCards.prefix(5))

        let oldCards = player.inHand as? Set<Card> ?? Set<Card>()

        if oldCards.isEmpty {
            // If the player has no cards in hand, add the first five cards to the player's hand.
            dataManager.addCardsToPlayerHand(newCards: Set(firstFiveCards))
        } else {
            // If the player has cards in hand, update their hand with the new set of cards.
            dataManager.updatePlayerHand(newCards: Set(firstFiveCards), usedCards: oldCards)
        }
    }
    
    func processSelectedCards(selectedCards: Set<Card>) {
        let player = dataManager.fetchPlayer()
        let monster = dataManager.fetchMonster()
        
        var healingValue: Double = 0.0
        var damageValue: Double = 0.0
        var stackHP: Int = 0
        var stackATK: Int = 0
        
        for card in selectedCards {
            if card.type == "HP" {
                healingValue += card.value
                stackHP += 1
            } else if card.type == "ATK" {
                damageValue += card.value
                stackATK += 1
            }
        }
        
        if stackHP == 2 {
            healingValue += 2
        }else if stackHP == 3 {
            healingValue += 3
        }
        
        if stackATK == 2 {
            damageValue += 2
        }else if stackATK == 3 {
            damageValue += 3
        }
        print("cura player")
        print(healingValue)
        print("Dano player")
        print(damageValue)
        print("fim turno player")
        let newPlayerHP = min(player.hp + healingValue, 30)
        dataManager.updatePlayerHP(value: newPlayerHP)
        
        let newMonsterHP = max(monster.hp - damageValue, 0)
        dataManager.updateMonsterHP(value: newMonsterHP)
    }
    
    // Function to simulate a player's turn
    func playerTurn() {
        replacePlayerHand()
    }
    
    // Function to simulate a monster's turn
    func monsterTurn() {
        let player = dataManager.fetchPlayer()
        let monsterDamage = calculateMonsterDamage()
        print("monster dano")
        print(monsterDamage)
        let newPlayerHP = max(player.hp - Double(monsterDamage), 0)
        dataManager.updatePlayerHP(value: newPlayerHP)
    }
    
    // Function to check if the game is over
    func isGameOver() -> Bool {
        let player = dataManager.fetchPlayer()
        let monster = dataManager.fetchMonster()
        return player.hp <= 0 || monster.hp <= 0
    }
    
    func selectedCards(cardSelected: Card){
        self.selectedCard.append(cardSelected)
    }
    
    func addToSelectedCards(selectedCard: Card) {
        if let index = self.selectedCard.firstIndex(of: selectedCard) {
            self.selectedCard.remove(at: index)
        } else {
            self.selectedCard.append(selectedCard)
        }
    }
    
    // MARK: - Helper Functions

    
    private func calculateMonsterDamage() -> Int {
        let randomDamage = Int.random(in: 5...15)
        return randomDamage
    }
}
