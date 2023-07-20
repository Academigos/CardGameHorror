//
//  HandCards.swift
//  CardGameHorror
//
//  Created by Erick Ribeiro on 18/07/23.
//

import SpriteKit

class HandCards: SKSpriteNode {
    // espaçamento entre às cartas
    let cardSpacing: CGFloat = 7
    // array de nós de cartas
    var cards: [CardNode] = []
    
    init(cardCount: Int) {
        
        super.init(texture: nil, color: .clear, size: .zero)
        // configurações de visualização das cartas
        setupCards(cardCount: cardCount)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // posicionamentos das cartas na cena
    func setupCards(cardCount: Int) {
        var totalWidth: CGFloat = 0.0
        var maxHeight: CGFloat = 0.0
        
        for index in 1...cardCount {
            let cardNode = CardNode(cardModel: "", value: 20)
            
            totalWidth += cardNode.size.width + cardSpacing
            maxHeight = max(maxHeight, cardNode.size.height)
            
            cardNode.isUserInteractionEnabled = true
            
            cardNode.savedInitialZPosition = CGFloat(index + 1)
            cardNode.zPosition = cardNode.savedInitialZPosition
            
            addChild(cardNode)
            
            cards.append(cardNode)
        }
        
        self.size = CGSize(width: totalWidth, height: maxHeight)
        
        animateCardAppearance()
    }
    
    // animação de inicialização das cartas
    func animateCardAppearance() {
        let containerWidth = CGFloat(cards.count) * cards[0].size.width + CGFloat(cards.count - 1) * cardSpacing
        let startX = (-containerWidth / 2) + cards[0].size.width / 2
        
        var currentX: CGFloat = startX
        let delay = 1.0
        let delay1 = SKAction.wait(forDuration: delay)
        
        var finalPosition:CGFloat = startX
        var lastPositionCard:CGFloat = 0
        var thirdPositionCard:CGFloat = 0
        
        for (index, cardNode) in cards.enumerated() {
            let configuration = CardConfigurations(rawValue: index + 1)
            guard let configuration = configuration else { return }
            
            let delay = TimeInterval(index) * 0.3 // Atraso para animar cada carta separadamente
            
            cardNode.position.y = configuration.position.y
            
            let moveAction = SKAction.move(to: CGPoint(x: finalPosition, y: configuration.position.y), duration: 0.5)
            moveAction.timingMode = .easeIn
            
            currentX += cards[0].size.width + cardSpacing
            
            if index == 1 {
                lastPositionCard = currentX
                let teste = lastPositionCard + 2 * (cards[0].size.width + cardSpacing)
                thirdPositionCard = teste
                finalPosition = thirdPositionCard
            } else{
                finalPosition = currentX
            }
            
            if index == 3 {
                finalPosition = lastPositionCard
            }
            
            let delayAction = SKAction.wait(forDuration: delay)
            
            let rotateAction = SKAction.rotate(toAngle: configuration.rotation, duration: 0.1)
            
            let sequenceAction = SKAction.sequence([delay1, delayAction, moveAction, rotateAction])
            
            cardNode.run(sequenceAction)
        }
    }
}
