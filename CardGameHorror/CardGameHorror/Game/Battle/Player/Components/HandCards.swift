//
//  HandCards.swift
//  CardGameHorror
//
//  Created by Erick Ribeiro on 18/07/23.
//

import SpriteKit

class HandCards: SKSpriteNode {
    let cardSpacing: CGFloat = 7
    var cards: [CardNode] = []
    
    init(cardCount: Int) {
        
        super.init(texture: nil, color: .blue, size: .zero)
        
        setupCards(cardCount: cardCount)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // posicionamentos das cartas na cena
    func setupCards(cardCount: Int) {
        var totalWidth: CGFloat = 0.0
        var maxHeight: CGFloat = 0.0
        
        for _ in 1...cardCount {
            let cardNode = CardNode(cardModel: "", value: 20)
            
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
        let containerWidth = CGFloat(cards.count) * cards[0].newWidthCard + CGFloat(cards.count - 1) * cardSpacing
        let startX = (-containerWidth / 2) + cards[0].newWidthCard / 2
        
        var currentX: CGFloat = startX
        
        for (index, cardNode) in cards.enumerated() {
            let configuration = CardConfigurations(rawValue: index + 1)
            guard let configuration = configuration else { return }
            
            cardNode.position = configuration.position
            
            let delay = TimeInterval(index) * 0.5 // Atraso para animar cada carta separadamente
            
            let moveAction = SKAction.move(to: CGPoint(x: currentX, y: cardNode.position.y), duration: 0.5)
            
            currentX += cards[0].newWidthCard + cardSpacing
            
            let delayAction = SKAction.wait(forDuration: delay)
            
            let rotateAction = SKAction.rotate(toAngle: configuration.rotation, duration: 0.5)
            cardNode.run(rotateAction)
            
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
