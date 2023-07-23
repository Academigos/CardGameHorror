//
//  TextNodeManager.swift
//  CardGameHorror
//
//  Created by Erick Ribeiro on 23/07/23.
//

import SpriteKit

class TextNodeManager {
    private let textNode: SKLabelNode
    
    init(textNode: SKLabelNode) {
        self.textNode = textNode
        // Configuração inicial para o nó de caixa de texto (fonte, cor, tamanho, etc.)
    }
    
    func updateText(newText: String) {
        textNode.text = newText
    }
}
