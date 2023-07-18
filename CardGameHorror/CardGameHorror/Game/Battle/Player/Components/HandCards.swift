//
//  HandCards.swift
//  CardGameHorror
//
//  Created by Erick Ribeiro on 18/07/23.
//

import SpriteKit

class HandCards: SKSpriteNode {
    let cardSpacing: CGFloat = 0
    var cards: [CardNode] = []
    
    init(sizeScreen: CGSize, cardCount: Int) {
        
        super.init(texture: nil, color: .blue, size: .zero)
        
        setupCards(sizeScreen: sizeScreen, cardCount: cardCount)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // posicionamentos das cartas na cena
    func setupCards(sizeScreen: CGSize, cardCount: Int) {
        var totalWidth: CGFloat = 0.0
        var maxHeight: CGFloat = 0.0
        
        for _ in 1...cardCount {
            let cardNode = CardNode(cardModel: "", value: 20)

            let proportionCard = cardNode.size.width / cardNode.size.height
            
            cardNode.scale(to: CGSize(width: sizeScreen.width * 0.14, height: sizeScreen.width * 0.14 / proportionCard))
            
            cardNode.savedInitialScale = CGSize(width: sizeScreen.width * 0.14, height: sizeScreen.width * 0.14 / proportionCard)
            
            totalWidth += cardNode.size.width + cardSpacing
            maxHeight = max(maxHeight, cardNode.size.height)
            
            cardNode.isUserInteractionEnabled = true
            
            addChild(cardNode)
            
            cards.append(cardNode)
        }
        
        self.size = CGSize(width: totalWidth, height: maxHeight)
  
        animateCardAppearance()
    }
    
    func animateCardAppearance() {
        
        var currentX: CGFloat = -self.size.width / 2 + cardSpacing / 2
        
        for (index, cardNode) in cards.enumerated() {
            
            let configuration = CardConfigurations(rawValue: index + 1)
            guard let configuration = configuration else { return }
            
            cardNode.position = configuration.position
            
            let delay = TimeInterval(index) * 0.5 // Atraso para animar cada carta separadamente
            
            let moveAction: SKAction
            
            moveAction = SKAction.move(to: CGPoint(x: currentX + cardNode.calculateAccumulatedFrame().width / 2, y: cardNode.position.y), duration: 0.5)
            
            currentX += cardNode.frame.width + cardSpacing
            
            let delayAction = SKAction.wait(forDuration: delay)
            
            let rotateAction = SKAction.rotate(toAngle: configuration.rotation, duration: 0.5)
                cardNode.run(rotateAction)
            
            // Criação de uma sequência de ações: atraso, easeOut e movimento para a posição final
            let sequenceAction = SKAction.sequence([delayAction, moveAction, rotateAction])
            
            cardNode.run(sequenceAction)
            
        }
    }
    
}

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
            return spriteRotation(angle: 0)
        case .configuration4:
            return spriteRotation(angle: -2.75)
        case .configuration5:
            return spriteRotation(angle: -4.25)
        }
    }
    
    var position: CGPoint {
        switch self {
        case .configuration1:
            return CGPoint(x: 0, y: 0)
        case .configuration2:
            return CGPoint(x: 0, y: 10)
        case .configuration3:
            return CGPoint(x: 0, y: 15)
        case .configuration4:
            return CGPoint(x: 0, y: 10)
        case .configuration5:
            return CGPoint(x: 0, y: 0)
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
