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
    let cardModel:Card
    
    //let cardTexture: CardTexture
    var cardType:CardType?
    let frontTexture: SKTexture
    var valueLabel: SKLabelNode = SKLabelNode()
    var value:Double = 0.0
    
    let proportionCard: CGFloat
//    var newWidthCard: CGFloat
//    var newHeightCard: CGFloat
    
    var faceUp = true
    var isSelected = false
    
    var savedInitialPosition = CGPoint.zero
    var savedInitialScale: CGSize = CGSize()
    var savedInitialRotation: CGFloat = 0.0
    var savedInitialZPosition:CGFloat = 0

    
    required init?(coder aDecoder: NSCoder) {
        fatalError("NSCoding not supported")
    }
    
    // inicializa o cardModel
    init(cardModel: Card) {
        self.cardModel = cardModel
        self.value = cardModel.value
        self.frontTexture = SKTexture(imageNamed: cardModel.image ?? "")
        //self.cardTexture = CardTexture(rawValue: "car")!
        if let type = cardModel.type, let cardType = CardType(rawValue: type) {
            self.cardType = cardType
        }
        
        proportionCard = frontTexture.size().width / frontTexture.size().height
//        newWidthCard = GameViewController.screenSize.width * 0.12
//        newHeightCard = newWidthCard / proportionCard
        
        // Inicializa a classe pai com a textura da carta
        super.init(texture: frontTexture, color: .clear, size: frontTexture.size())
        
        // Configura label da carta
        setupValueLabel()
        
        self.scale(to: autoScale( self, widthProportion: 0.12, screenSize: GameViewController.screenSize))
        
        savedInitialScale = autoScale( self, widthProportion: 0.12, screenSize: GameViewController.screenSize)
        
        // adiciona efeito de luz atrás da carta
        self.addGlow(color: .black)
    }
    
    
    // Configura Label da carta
    private func setupValueLabel() {
        valueLabel.name = "valueLabel"
        valueLabel.fontSize = size.height * 0.065
        valueLabel.fontName = "Helvetica-Bold"
        valueLabel.fontColor = .white
        valueLabel.verticalAlignmentMode = .top
        valueLabel.horizontalAlignmentMode = .right
        valueLabel.position = CGPoint(x: size.width * 0.375, y: size.height * 0.43)
        valueLabel.text = String(Int(self.value))
        valueLabel.zPosition = 1.0
        
        addChild(valueLabel)
    }
    
    // identifica o toque na carta
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if touches.first != nil {
            let moreThanThreeSelected = GameController.shared.selectedCard.count < 3
            
            if moreThanThreeSelected || isSelected {
                enlarge()
                GameController.shared.addToSelectedCards(selectedCard:  cardModel)
            }

        }
        
        super.touchesBegan(touches, with: event)
    }
    
    // Função para ampliar a carta
    func enlarge() {
        if isSelected {
            // Se a carta já estiver ampliada, reduz seu tamanho e a retorna para a posição original
            let slide = SKAction.move(to: savedInitialPosition, duration: 0.3)
            let scaleDown = SKAction.scale(to: savedInitialScale, duration: 0.3)
            
            // retorna efeito carta normal
            self.addGlow(color: .black)
            // retorna zPosition inicial
            self.zPosition = savedInitialZPosition
            
            run(SKAction.group([slide, scaleDown])) {
                self.isSelected = false
                self.zRotation = self.savedInitialRotation
            }
            
        } else {
            // Se a carta não estiver ampliada, a amplia
            isSelected = true
            savedInitialPosition = position
            
            self.zPosition += savedInitialZPosition
            
            if let parent = parent {
                removeAllActions()
                self.savedInitialRotation = zRotation
                self.zRotation = 0
                let newPosition = CGFloat(parent.frame.midY - parent.frame.height/6)
                
                let slide = SKAction.moveTo(y: newPosition, duration: 0.3)
                
                let scaleUp = SKAction.scale(to: CGSize(width: size.width * 1.2, height: size.height * 1.2), duration: 0.3)
                
                run(SKAction.group([scaleUp, slide]))
                self.addGlow(color: .red)
            }
        }
    }
}

extension SKSpriteNode {

    // Adiciona Efeito
    func addGlow(radius: Float = 40, color: UIColor) {
        removeGlow()
        let effectNode = SKEffectNode()
        effectNode.shouldRasterize = true
        addChild(effectNode)
        let effect = SKSpriteNode(texture: texture)
        effect.color = color
        effect.colorBlendFactor = 1
        effectNode.addChild(effect)
        effectNode.filter = CIFilter(name: "CIGaussianBlur", parameters: ["inputRadius":radius])
        
    }
    
    // Remove Efeito
    func removeGlow() {
           // Procura pelo nó de efeito (SKEffectNode) adicionado anteriormente
           if let effectNode = children.first(where: { $0 is SKEffectNode }) {
               effectNode.removeFromParent()
           }
       }
}
