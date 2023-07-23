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
    var cardsModel: [Card] = []
    
    init(cards: [Card]) {
        
        super.init(texture: nil, color: .clear, size: .zero)
        // configurações de visualização das cartas
        cardsModel = cards
        setupCards()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func animateEntryHand() {
        self.position = CGPoint(x: GameViewController.screenSize.width * 0.5, y: -self.size.height)
        let finalPosition = CGPoint(x: GameViewController.screenSize.width * 0.5, y: self.size.height * 0.4)
        
        // Crie uma ação para mover o nó de sua posição inicial até a posição final
        let moveAction = SKAction.moveTo(y: finalPosition.y, duration: 1.0)
        // Adicione uma ação de bloqueio para manter o nó na posição final
        let holdAction = SKAction.wait(forDuration: 0.5)
        
        // Combine as ações em uma sequência
        let sequence = SKAction.sequence([moveAction, holdAction])
        self.run(sequence)
    }
    
    func animateExitHand(completion: @escaping () -> Void) {
        
        let finalPosition = CGPoint(x: GameViewController.screenSize.width * 0.5, y: -self.size.height * 0.9)
        
        // Crie uma ação para mover o nó de sua posição inicial até a posição final
        let moveAction = SKAction.moveTo(y: finalPosition.y, duration: 1.0)
        
        // Crie uma ação para remover o nó da cena após a animação ser concluída
        let removeAction = SKAction.removeFromParent()
        
        // Define a função executada após a animação
        func clearHand() {
            completion()
        }
        
        // Crie um SKAction.run e passe a função clearHand como parâmetro
        let clearHandAction = SKAction.run(clearHand)
        
        let holdAction = SKAction.wait(forDuration: 0.5)
        
        // Combine as ações em uma sequência
        let sequence = SKAction.sequence([moveAction, removeAction, clearHandAction, holdAction])
        self.run(sequence)
    }
    
    // posicionamentos das cartas na cena
    func setupCards() {
        var totalWidth: CGFloat = 0.0
        var maxHeight: CGFloat = 0.0
        for (index, cardModel) in cardsModel.enumerated() {
            let cardNode = CardNode(cardModel: cardModel, indexArray: index)
            
            totalWidth += cardNode.size.width + cardSpacing
            maxHeight = max(maxHeight, cardNode.size.height)
            
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
            
            let enableInteractionAction = SKAction.run {
                cardNode.isUserInteractionEnabled = true
            }
            
            let rotateAction = SKAction.rotate(toAngle: configuration.rotation, duration: 0.1)
            
            let sequenceAction = SKAction.sequence([delay1, delayAction, moveAction, rotateAction, enableInteractionAction])
            
            cardNode.run(sequenceAction)
        }
    }
}
