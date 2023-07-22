//
//  CardConfigurations.swift
//  CardGameHorror
//
//  Created by Erick Ribeiro on 19/07/23.
//

import SpriteKit

// enum com definição padrão de posicionamentos
enum CardConfigurations: Int {
    case configuration1 = 1
    case configuration2 = 2
    case configuration3 = 3
    case configuration4 = 4
    case configuration5 = 5
    
    var rotation: CGFloat {
        switch self {
        case .configuration1:
            return spriteRotation(angle: 4.25)
        case .configuration2:
            return spriteRotation(angle: 2.75)
        case .configuration3:
            return spriteRotation(angle: -4.25)
        case .configuration4:
            return spriteRotation(angle: -2.75)
        case .configuration5:
            return spriteRotation(angle: 0)
        }
    }
    
    var position: CGPoint {
        switch self {
        case .configuration1:
            return CGPoint(x: 0, y: 0)
        case .configuration2:
            return CGPoint(x: 0, y: 10)
        case .configuration3:
            return CGPoint(x: 0, y: 0)
        case .configuration4:
            return CGPoint(x: 0, y: 10)
        case .configuration5:
            return CGPoint(x: 0, y: 15)
        }
    }
    
    init?(rawValue: Int) {
        switch rawValue {
        case 1:
            self = .configuration1
        case 2:
            self = .configuration2
        case 3:
            self = .configuration3
        case 4:
            self = .configuration4
        case 5:
            self = .configuration5
        default:
            return nil
        }
    }
    
    func spriteRotation(angle: Double) -> CGFloat {
        return angle * .pi / 180.0
    }
}

// Enumeração que define os tipos de textura disponíveis
enum CardTexture: String {
    case force = "A Força"
    case car = "O Carro"
    case hanged = "O Enforcado"
    
    // Método estático para converter uma string em um valor da enumeração CardTexture
    static func fromString(_ string: String) -> CardTexture? {
        switch string.lowercased() {
        case "car":
            return .car
        case "force":
            return .force
        case "hanged":
            return .hanged
        default:
            return nil
        }
    }
}
