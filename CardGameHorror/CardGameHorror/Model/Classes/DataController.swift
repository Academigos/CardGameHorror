//
//  DataControll.swift
//  CardGameHorror
//
//  Created by Eduardo on 16/07/23.
//

import Foundation
import SpriteKit
import GameplayKit

class PlayerController{
    let player = DataManager().fetchPlayer()
    let cards = DataManager().fetchCard()
    let playerHealth: Double = 30
    let maxCard = 5
    let stackDaamge: [Double] = [2, 3]
    
    func getCardsInHand(){
        DataManager().player(value: playerHealth, newCards: randomCards())
        print(player.inHand!)
    }
    
    func getCardsInHand(playerHealth: Double){
        if let cardInHand = player.inHand {
            DataManager().player(value: playerHealth, newCards: randomCards(), usedCards: cardInHand)
        }
        DataManager().player(value: playerHealth, newCards: randomCards())
    }
    func cardsInHand() -> [Card]{
        let cardInHand = DataManager().fetchCardPlayer(player: player)
        return cardInHand
    }
    
    private func randomCards() -> NSSet { // NSSet is replaced with Set<AnyHashable> in Swift
        let shuffledCards = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: Array(cards))
        let cardsInHand = NSSet(array: Array(shuffledCards.prefix(maxCard)))
        return cardsInHand
    }
    
    func cardsDamage(cardSelected: [Card]){
        var healValue: Double = 0
        var damageValue: Double = 0
        for card in cardSelected{
            if card.type == "HP" {
                healValue += card.value
            }else{
                damageValue = damageValue + card.value
            }
        }
    }
    func isDead() -> Bool{
        return player.hp <= 0
    }
}

class MonsterController{
    
    let monster = DataManager().fetchMonster()
    var monsterHelth: Double = 60
    let minDmg: Double = 5
    let maxDmg: Double = 10

    
    func health(){
        monsterHelth = 60
        DataManager().monster(value: self.monsterHelth)
    }
    
    func health(valeu: Double ){
        monsterHelth = valeu
        DataManager().monster(value: valeu)
    }
    
    func damage() -> Double{
        var dmg: Double = 5
        return dmg
    }
}
