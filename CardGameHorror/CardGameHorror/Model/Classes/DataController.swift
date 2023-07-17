//
//  DataControll.swift
//  CardGameHorror
//
//  Created by Eduardo on 16/07/23.
//

import Foundation
import SpriteKit
import GameplayKit

protocol didMonsterAtack: AnyObject {
    func didAttackPlayer(withDamage damage: Double)
}

protocol didPlayerAtack: AnyObject {
    func didAttackMonster(withDamage damage: Double)
}


class PlayerController: didMonsterAtack {
    
    weak var delegateMonster: didPlayerAtack?
    
    let player = DataManager().fetchPlayer()
    let playerMaxHealth: Double = 30
    let maxCard = 5
    let stackDaamge: [Double] = [2, 3]
        
    func initPlayer() {
        DataManager().player(value: playerMaxHealth)
    }
    
    func getCardsInHand() {
        if let cardInHand = player.inHand {
            DataManager().player(newCards: randomCards(), usedCards: cardInHand)
        }else{
            DataManager().player(newCards: randomCards())
        }
    }
    
    func cardsInHand() -> [Card] {
        let cardInHand = DataManager().fetchCardPlayer(player: player)
        return cardInHand
    }
    
    private func randomCards() -> NSSet { // NSSet is replaced with Set<AnyHashable> in Swift
        let cards = DataManager().fetchCard()
        let shuffledCards = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: Array(cards))
        let cardsInHand = NSSet(array: Array(shuffledCards.prefix(maxCard)))
        return cardsInHand
    }
    
    func cardsEffect(cardSelected: [Card]) {
        var healValue: Double = 0
        var damageValue: Double = 0
        for card in cardSelected{
            if card.type == "HP" {
                healValue += card.value
            }else{
                damageValue = damageValue + card.value
            }
        }
        heal(value: healValue)
        delegateMonster?.didAttackMonster(withDamage: damageValue)
    }
    
    private func heal(value: Double) {
        if player.hp <= playerMaxHealth{
            if player.hp + value > playerMaxHealth{
                player.hp = playerMaxHealth
            }else{
                player.hp += value
            }
            DataManager().saveContext()
        }
    }
    
    func didAttackPlayer(withDamage damage: Double) {
        if player.hp - damage < 0{
            player.hp = 0
        }else{
            player.hp -= damage
        }
        DataManager().saveContext()
    }
    
    func isDead() -> Bool {
        return player.hp <= 0
    }
    
    func playerBarLife() -> Double {
        return player.hp / playerMaxHealth
    }
}

class MonsterController: didPlayerAtack {
    weak var delagetePlayer: didMonsterAtack?
    
    let monster = DataManager().fetchMonster()
    let monsterMaxHelth: Double = 60
    let minDmg: Double = 5
    let maxDmg: Double = 10

    
    func initMonster() {
        DataManager().monster(value: monsterMaxHelth)
    }
    
    func didAttackMonster(withDamage damage: Double) {
        if monster[0].hp - damage < 0{
            monster[0].hp = 0
        }else{
            monster[0].hp -= damage
        }
        DataManager().saveContext()
    }
    
    func attack() {
        var dmg: Double = 5
        delagetePlayer?.didAttackPlayer(withDamage: dmg)
    }
    
    func isDead() -> Bool {
        return monster[0].hp <= 0
    }
    
    func monsterBarLife() -> Double {
        return monster[0].hp / monsterMaxHelth
    }
}
