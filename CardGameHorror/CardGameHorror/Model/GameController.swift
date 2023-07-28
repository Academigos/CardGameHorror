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
    
    let isCutScenePassedKey = "isCutScenePassedKey"
    
    static var isCutScenePassed: Bool {
        get {
            return UserDefaults.standard.bool(forKey: GameController.shared.isCutScenePassedKey)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: GameController.shared.isCutScenePassedKey)
        }
    }
    
    let playerLife: Double = 30
    let monsterLife: Double = 100
    @objc dynamic var selectedCard: [Card] = []
    // MARK: - Game Actions
    
    // Function to start a new game
    func startNewGame() {
        _ = DataManager()
        dataManager.updatePlayerHP(value: playerLife) // Reset player's health points
        dataManager.updateMonsterHP(value: monsterLife) // Reset monster's health points
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
    func monsterTurn() -> Int {
        let player = dataManager.fetchPlayer()
        let monsterDamage = calculateMonsterDamage()
        let newPlayerHP = max(player.hp - Double(monsterDamage), 0)
        dataManager.updatePlayerHP(value: newPlayerHP)
        return monsterDamage
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
        let randomDamage = Int.random(in: 5...10)
        return randomDamage
    }
    
    func getDeviceModel() -> String {
        let iphoneSize = GameViewController.screenSize
        print(iphoneSize)
        switch iphoneSize {
            // iPhone SE (1st & 2nd generation)
        case CGSize(width: 568, height: 320), CGSize(width: 667, height: 375):
            return "iPhone SE"
            // iPhone 8, 8 Plus
        case CGSize(width: 887, height: 375), CGSize(width: 736, height: 414):
            return "iPhone 8"
            // iPhone X, XS, 11 Pro
        case CGSize(width: 812, height: 375), CGSize(width: 896, height: 375):
            return "iPhone X"
            // iPhone XR, 11, 11 Pro Max
        case CGSize(width: 896, height: 414):
            return "iPhone 11"
            // iPhone 12, 12 Pro
        case CGSize(width: 844, height: 390):
            return "iPhone 12"
            // iPhone 12 mini
        case CGSize(width: 780, height: 360):
            return "iPhone mini"
            // iPhone 14
        case CGSize(width: 852, height: 393):
            return "iPhone 14"
        case  CGSize(width: 926, height: 428), CGSize(width: 932, height: 430):
            return "iPhone 14 Pro"
        default:
            return "Unknown iPhone"
        }
    }
}
/*
if GameController.shared.getDeviceModel() == "iPhone SE"{
    
}else if GameController.shared.getDeviceModel() == "iPhone 8"{
    
}else if GameController.shared.getDeviceModel() == "iPhone X"{
    
}else if GameController.shared.getDeviceModel() == "iPhone 11"{
    
}else if GameController.shared.getDeviceModel() == "iPhone 12"{
    
}else if GameController.shared.getDeviceModel() == "iPhone mini"{
    
}else if GameController.shared.getDeviceModel() == "iPhone 13"{
    
}else if GameController.shared.getDeviceModel() == "iPhone 14"{
    
}else {
    
}
*/
