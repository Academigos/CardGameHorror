//
//  DataManager.swift
//  CardGameHorror
//
//  Created by Eduardo on 14/07/23.
//

import Foundation
import CoreData
import UIKit

class DataManager {
    static let shared = DataManager()
    
    // Reference to managed object context
    private let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    init() {
        createInitialCardsIfNeeded()
        createInitialPlayerIfNeeded()
        createInitialMonsterIfNeeded()
    }
    // MARK: - Card CRUD
    
    // Default creation of card
    private func createCard(typeTexture: String, image: String, type: String, value: Double) -> Card {
        let card = Card(context: context)
        card.id = UUID()
        card.image = image
        card.type = type
        card.value = value
        card.typeTexture = typeTexture
        return card
    }
    
    func createInitialCardsIfNeeded() {
        do {
            let cardCount = try context.count(for: Card.fetchRequest())
            guard cardCount < 1 else {
                return // Initial cards already exist, no need to recreate
            }

            // Define your initial cards here
            let cardsData: [(typeTexture: String,image: String, type: String, value: Double)] = [
                ("car", "carro_atk", "ATK", 2),
                ("hanged", "enforcado_atk", "ATK", 2),
                ("force", "forca_atk", "ATK", 2),
                ("car", "carro_atk", "ATK", 4),
                ("hanged", "enforcado_atk", "ATK", 4),
                ("force", "forca_atk", "ATK", 4),
                ("car", "carro_atk", "ATK", 6),
                ("hanged", "enforcado_atk", "ATK", 6),
                ("force", "forca_atk", "ATK", 8),
                ("car", "carro_hp", "HP", 2),
                ("hanged", "enforcado_hp", "HP", 2),
                ("force", "forca_hp", "HP", 2),
                ("car", "carro_hp", "HP", 4),
                ("hanged", "enforcado_hp", "HP", 4),
                ("force", "forca_hp", "HP", 6)
            ]

            // Create and add the cards to the context
            for cardData in cardsData {
                _ = createCard(typeTexture: cardData.typeTexture, image: cardData.image, type: cardData.type, value: cardData.value)
            }
            saveContext()
        } catch {
            fatalError("Failed to check card count: \(error)")
        }
    }
    // MARK: - Player CRUD
    
    func createInitialPlayerIfNeeded() {
        do {
            let players = try context.fetch(Player.fetchRequest()) as! [Player]
            guard players.isEmpty else {
                return // Player already exists, no need to recreate
            }
            _ = Player(context: context)
            
            saveContext()
        } catch {
            fatalError("Failed to create player: \(error)")
        }
    }
    
    /// Used to update the player's health points (HP)
    func updatePlayerHP(value: Double) {
        
        let player = fetchPlayer()
        player.hp = value
        saveContext()
    }
    // set cards in relationship
    func addCardsToPlayerHand(newCards: Set<Card>) {
        let player = fetchPlayer()
        player.addToInHand(newCards as NSSet)
        saveContext()
    }
    // change cards in relationship inHand
    func updatePlayerHand(newCards: Set<Card>, usedCards: Set<Card>) {
        let player = fetchPlayer()
        player.removeFromInHand(usedCards as NSSet)
        player.addToInHand(newCards as NSSet)
        saveContext()
    }
    
    // MARK: - Monster CRUD
    
    func createInitialMonsterIfNeeded() {
            do {
                let monsters = try context.fetch(Monster.fetchRequest()) as! [Monster]
                guard monsters.isEmpty else {
                    return // Monster already exists, no need to recreate
                }
                
                _ = Monster(context: context)
                saveContext()
            } catch {
                fatalError("Failed to create monster: \(error)")
            }
        }
    
    //update monster HP to new value
    func updateMonsterHP(value: Double) {
        let monster = fetchMonster()
        monster.hp = value
        saveContext()
    }
    
    // MARK: - Fetch Requests
    // get cards in relationship
    func fetchCardPlayer() -> [Card] {
        let player = fetchPlayer()
        
        let fetchRequest: NSFetchRequest<Card> = Card.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "inHand == %@", player)
        
        do {
            let cards = try context.fetch(fetchRequest)
            return cards
        } catch {
            fatalError("Error fetching cards: \(error)")
        }
    }
    //get cards data
    func fetchCard() -> [Card] {
        do {
            let card = try context.fetch(Card.fetchRequest())
            return card
        } catch {
            fatalError("Error in fetchCard: \(error)")
        }
    }
    //get player data
    func fetchPlayer() -> Player {
        do {
            let players = try context.fetch(Player.fetchRequest()) as! [Player]
            if let player = players.first {
                return player
            } else {
                let player = Player(context: context)
                saveContext()
                return player
            }
        } catch {
            fatalError("Error in fetchPlayer: \(error)")
        }
    }
    
    // get mosnter data
    func fetchMonster() -> Monster {
        do {
            let monsters = try context.fetch(Monster.fetchRequest()) as! [Monster]
            if let monster = monsters.first {
                return monster
            } else {
                let monster = Monster(context: context)
                saveContext()
                return monster
            }
        } catch {
            fatalError("Error in fetchMonster: \(error)")
        }
    }
    
    // MARK: - Core Data Saving support
    
    func saveContext() {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
