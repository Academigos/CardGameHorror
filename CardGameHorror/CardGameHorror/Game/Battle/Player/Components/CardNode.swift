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
    var valueLabel: SKLabelNode
    var value:Double = 0.0
    var playerController:PlayerController = PlayerController()
    
    let proportionCard: CGFloat
    var newWidthCard: CGFloat
    var newHeightCard: CGFloat
    
    var faceUp = true
    var enlarged = false
    var isSelected = false
    
    var savedInitialPosition = CGPoint.zero
    var savedInitialScale: CGSize = CGSize()
    var savedInitialRotation: CGFloat = 0.0
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("NSCoding not supported")
    }
    
    // inicializa o cardModel
    init(cardModel: Any, value: Double) {
        self.value = value
        self.frontTexture = SKTexture(imageNamed: "forca_atk")
        self.cardTexture = CardTexture(rawValue: "car")!
        self.cardType = CardType(rawValue: "ATK")!
        
        proportionCard = frontTexture.size().width / frontTexture.size().height
        newWidthCard = GameViewController.screenSize.width * 0.14
        newHeightCard = newWidthCard / proportionCard
        
        // Configura o label de valor da carta
        valueLabel = SKLabelNode()
        
        // Inicializa a classe pai com a textura da carta
        super.init(texture: frontTexture, color: .clear, size: frontTexture.size())
        
        setupValueLabel()
        
        self.scale(to: CGSize(width: newWidthCard, height: newHeightCard))
        savedInitialScale = CGSize(width: newWidthCard, height: newHeightCard)
        addNeonOutline()
        
        print(
            playerController.getCardsInHand()
        )
    }
    
   
    
    private func setupValueLabel() {
        valueLabel.name = "valueLabel"
        valueLabel.fontSize = 32
        valueLabel.fontName = "Helvetica-Bold"
        valueLabel.fontColor = .white
        valueLabel.verticalAlignmentMode = .top
        valueLabel.horizontalAlignmentMode = .right
        valueLabel.position = CGPoint(x: size.width * 0.4, y: size.height * 0.43)
        valueLabel.text = String(Int(self.value))
        valueLabel.zPosition = 1.0
        
        addChild(valueLabel)
    }
    
    // identifica o toque na carta
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            //   let location = touch.location(in: self)
            
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
                
                let scaleUp = SKAction.scale(to: CGSize(width: newWidthCard * 1.2, height: newHeightCard * 1.2), duration: 0.3)
                
                run(SKAction.group([scaleUp, slide]))
            }
        }
    }
    
    func addNeonOutline() {
        let outlineNode = SKShapeNode(rectOf: CGSize(width: self.newWidthCard * 3.2, height: self.newHeightCard * 3.2))
        print(outlineNode.frame.width)
        outlineNode.fillColor = .cyan
     //   outlineNode.lineWidth = 5.0
        outlineNode.glowWidth = 5.0
        
        let effectNode = SKEffectNode()
        //effectNode.addChild(outlineNode)
        effectNode.filter = CIFilter(name: "CIGaussianBlur", parameters: ["inputRadius": 10.0])
        effectNode.zPosition = 99
        addChild(outlineNode)
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

