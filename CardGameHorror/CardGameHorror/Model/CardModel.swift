//
//  Stats.swift
//  CardGameHorror
//
//  Created by Erick Ribeiro on 11/07/23.
//

import Foundation

protocol Card {
    var id: String{ get set }
    var cover: String{ get set }
    var type: String { get set }
    var value: Double{ get set }
}

struct CardModel: Card{
    var id: String
    var cover: String
    var type: String
    var value: Double
}

extension CardModel{
    static let cards:[CardModel] = [CardModel(id: "ATK2-01", cover: "", type: "ATK", value: 2.0), CardModel(id: "ATK2-02 ", cover: "", type: "ATK", value: 2.0),CardModel(id: "ATK2-03", cover: "", type: "ATK", value: 2.0), CardModel(id: "ATK3-01", cover: "", type: "ATK", value: 3.0), CardModel(id: "ATK3-02", cover: "", type: "ATK", value: 3.0), CardModel(id: "ATK3-03", cover: "", type: "ATK", value: 3.0)]
}


