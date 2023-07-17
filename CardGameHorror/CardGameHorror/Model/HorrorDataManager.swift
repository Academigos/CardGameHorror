//
//  HorrorDataManager.swift
//  CardGameHorror
//
//  Created by Eduardo on 14/07/23.
//

import Foundation
import CoreData
import UIKit

class DataManager{
    static let shared = DataManager()
    
    
    //MARK: - Constante
    private struct Constants {
        static let vidaInicial: Double = 30
        static let vidaMedoInicial: Double = 60
        static let danoMinimo: Double = 2
        
    }
    // refence to managed object context
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    //define creation of card in database
    init(){
        do{
            let playerCount = try self.context.count(for:Card.fetchRequest())
            
            if playerCount < 1{
                card(image: "", type: "ATK", value: Constants.danoMinimo)
                card(image: "", type: "ATK", value: 2)
                card(image: "", type: "ATK", value: 2)
                card(image: "", type: "ATK", value: 4)
                card(image: "", type: "ATK", value: 4)
                card(image: "", type: "ATK", value: 4)
                card(image: "", type: "ATK", value: 6)
                card(image: "", type: "ATK", value: 6)
                card(image: "", type: "ATK", value: 8)
                card(image: "", type: "HP", value: 2)
                card(image: "", type: "HP", value: 2)
                card(image: "", type: "HP", value: 2)
                card(image: "", type: "HP", value: 4)
                card(image: "", type: "HP", value: 4)
                card(image: "", type: "HP", value: 6)
                saveContext()
            }
        }catch{
            fatalError("fail to search data in init of CoreDataManager: \(error)")
        }
    }
    
    // MARK: card CRUD
    
    //defalt create of card
    private func card(image:String, type: String, value: Double){
        let card = Card(context: self.context)
        card.id = UUID()
        card.image = image
        card.type = type
        card.value = value
    }
    
    // MARK: player CRUD
    func player(value: Double, newCards:NSSet){
        let player = Player(context: self.context)
        player.hp = value
        addToHand(cards: newCards)
        saveContext()
    }
    
    func player(value: Double, newCards:NSSet, usedCards:NSSet){
        
        let player = Player(context: self.context)
        
        player.hp = value
        cleanHand(cards: usedCards)
        addToHand(cards: newCards)
        saveContext()
    }
    
    // function about relationship inHand
    
    private func addToHand(cards: NSSet){
        let player = Player(context: self.context)
        player.addToInHand(cards)
    }
    
    private func cleanHand(cards: NSSet){
        let player = Player(context: self.context)
        player.removeFromInHand(cards)
    }
    
    //MARK: enemy CRUD
    
    func monster(value: Double){
        let monster = Monster(context: self.context)
        monster.hp = value
        saveContext()
    }
    
    // MARK: - fetchRequest
    func fetchCardPlayer(player: Player) -> [Card]{
        let fetchRequest: NSFetchRequest<Card> = Card.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "player == %@", player)
        
        do {
            let cards = try context.fetch(fetchRequest)
            return cards
        } catch {
            fatalError("Error fetching cards: \(error)")
        }
    }
    
    func fetchCard() -> [Card]{
        do{
            let card = try self.context.fetch(Card.fetchRequest())
            return card
        }catch{
            fatalError("Error in fetchCard: \(error)")
        }
    }
    
    func fetchPlayer() -> Player{
        do{
            let player = try self.context.fetch(Player.fetchRequest())
            return player[0]
        }catch{
            fatalError("Error in fetchPlayer: \(error)")
        }
    }
    
    func fetchMonster() -> [Monster]{
        
        do{
            let monster = try self.context.fetch(Monster.fetchRequest())
            return monster
        }catch{
            fatalError("Erro in fetchEnemy: \(error)")
        }
    }
    
    
    // MARK: - Core Data Saving support

    func saveContext () {
        if self.context.hasChanges {
            do {
                try self.context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
