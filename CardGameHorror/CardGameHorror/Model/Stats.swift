//
//  Stats.swift
//  CardGameHorror
//
//  Created by Erick Ribeiro on 11/07/23.
//

import Foundation

protocol Stats {
    var health: Double { get set }
    var maxHealth: Double { get set }
    var attack: Double? { get set }
}
