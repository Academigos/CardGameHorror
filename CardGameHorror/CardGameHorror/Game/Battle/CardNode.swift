//
//  cards.swift
//  CardGameHorror
//
//  Created by Eduardo on 11/07/23.
//

import SpriteKit

// Enumeração que define os tipos de textura disponíveis
enum CardTexture: String {
   case force
   case car
   case hanged
}

// Enumeração que define os tipos de cartas disponíveis
enum CardType: String {
   case ATK
   case DEF
}

class CardNode: SKSpriteNode {
    let cardTexture: CardTexture
    let cardType:CardType
    let frontTexture: SKTexture
    let valueLabel: SKLabelNode
    var value:Double = 0.0
    
    var faceUp = true
    var enlarged = false
    var isSelected = false
    
    var savedInitialPosition = CGPoint.zero
    var savedInitialScale: CGSize = CGSize()
    var savedInitialRotation: CGFloat = 0.0

    required init?(coder aDecoder: NSCoder) {
        fatalError("NSCoding not supported")
    }
    
    init(cardModel: Any, value: Double) {
        self.value = value
        self.frontTexture = SKTexture(imageNamed: "força_atk_1x")
        self.cardTexture = CardTexture(rawValue: "car")!
        self.cardType = CardType(rawValue: "ATK")!

        
        // Configura o label de valor da carta
        valueLabel = SKLabelNode()
        valueLabel.name = "valueLabel"
        valueLabel.fontSize = 32
        valueLabel.fontName = "Helvetica-Bold"
        valueLabel.fontColor = .white
        valueLabel.position = CGPoint(x: frontTexture.size().width / 2 - 37, y: frontTexture.size().height / 2 - 55)
        valueLabel.text = String(Int(self.value))
        valueLabel.zPosition = 99.0
        
        // Inicializa a classe pai com a textura da carta
        super.init(texture: frontTexture, color: .clear, size: frontTexture.size())
        addChild(valueLabel)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let location = touch.location(in: self)
            
            enlarge()
        }
        
        super.touchesBegan(touches, with: event)
    }
    
    
    // Função para ampliar a carta
    func enlarge() {
        if enlarged {
            // Se a carta já estiver ampliada, reduz seu tamanho e a retorna para a posição original
            let slide = SKAction.move(to: savedInitialPosition, duration: 0.3)
            let scaleDown = SKAction.scale(to: savedInitialScale, duration: 0.3)
            
            run(SKAction.group([slide, scaleDown])) {
                self.enlarged = false
               // self.zPosition = CardLevel.board.rawValue
                self.zRotation = self.savedInitialRotation
            }
        } else {
            // Se a carta não estiver ampliada, a amplia
            enlarged = true
            savedInitialPosition = position
            
          //  zPosition = CardLevel.enlarged.rawValue
            
            if let parent = parent {
                removeAllActions()
                self.savedInitialRotation = zRotation
                zRotation = 0
                let newPosition = CGFloat(parent.frame.midY - parent.frame.height/4)
                let slide = SKAction.moveTo(y: newPosition, duration: 0.3)
                let scaleUp = SKAction.scale(to: 0.5, duration: 0.3)
                
                run(SKAction.group([scaleUp, slide]))
            }
        }
    }
    
    // executar ação da carta
    
//    func useCard(enemy: Any,  player: Any) {
//        switch cardType {
//        case .ATK:
//            enemy.takeDamage(damage: value)
//        case .DEF:
//            player.regenHealth(heal: value)
//        }
//    }

    
}

