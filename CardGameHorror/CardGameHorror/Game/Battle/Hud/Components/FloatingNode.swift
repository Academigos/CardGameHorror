//
//  StackPopUp.swift
//  CardGameHorror
//
//  Created by Erick Ribeiro on 23/07/23.
//

import SpriteKit

class FloatingNode: SKSpriteNode {
    var stack:Int = 0
    var colorLabel:UIColor = .white
    
    init() {
        // Defina o tamanho inicial do nó de sprite
        let size = CGSize(width: 80, height: 80)
        
        // Chame o inicializador super da classe SKSpriteNode, usando a cor clara e o tamanho definido acima
        super.init(texture: nil, color: .clear, size: size)
        
        // Redimensione o nó de sprite para ajustá-lo automaticamente à tela
        // scale(to: autoScale(self, widthProportion: 1, screenSize: GameViewController.screenSize))
        self.addGlow(color: UIColor.black)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func checkStackSelectedCards(position: CGPoint) {
        var attackCount = 0
        var hpCount = 0
        var damage = 0
        var heal = 0
        
        for card in GameController.shared.selectedCard {
            switch card.type {
            case "ATK":
                attackCount += 1
                damage += Int(card.value)
            case "HP":
                hpCount += 1
                heal += Int(card.value)
            default:
                break
            }
        }
        
        // Verificar se há duas cartas do mesmo tipo (ATK ou HP) e definir a cor e stack com base nisso
        if attackCount == 2 || attackCount == 3 {
            colorLabel = .red
            stack = attackCount
        } else if hpCount == 2 || hpCount == 3 {
            colorLabel = .green
            stack = hpCount
        }
        // Bônus de stack
        showStackPopUp(at: position)
        
        // Dano de ataque
        if damage != 0 {
            showDamagePopUp(at: CGPoint(x: GameViewController.screenSize.width * 0.5, y: GameViewController.screenSize.height * 0.7), value: damage + stack)
        }
        
        // valor de cura
        if heal != 0 {
            showHealPopUp(value: heal + stack)
        }
    }
    
    func showStackPopUp(at position: CGPoint) {
        let damageLabel = FloatingLabel(text: "+\(stack) Bônus", color: colorLabel)
        damageLabel.position = position
        damageLabel.position.y = damageLabel.position.y * 1.7
        damageLabel.fontSize = self.size.width * 0.2
        addChild(damageLabel)
        
        // Animação para o número flutuante
        let moveAction = SKAction.move(by: CGVector(dx: 0, dy: 15), duration: 1.5) // Movimenta o número flutuante para cima
        let fadeOutAction = SKAction.fadeOut(withDuration: 3.0) // Desaparece com o número flutuante
        let removeAction = SKAction.removeFromParent() // Remove o número flutuante da cena
        
        let sequenceAction = SKAction.sequence([SKAction.group([moveAction, fadeOutAction]), removeAction])
        damageLabel.run(sequenceAction)
    }
    
    func showDamagePopUp(at position: CGPoint, value: Int) {
        let damageLabel = FloatingLabel(text: "-\(value)", color: .red)
        damageLabel.position = position
        damageLabel.fontSize = self.size.width * 0.2
        addChild(damageLabel)
        
        // Animação para o número flutuante
        let moveAction = SKAction.move(by: CGVector(dx: 0, dy: 15), duration: 1.5) // Movimenta o número flutuante para cima
        let fadeOutAction = SKAction.fadeOut(withDuration: 3.0) // Desaparece com o número flutuante
        let removeAction = SKAction.removeFromParent() // Remove o número flutuante da cena
        
        let sequenceAction = SKAction.sequence([SKAction.group([moveAction, fadeOutAction]), removeAction])
        damageLabel.run(sequenceAction)
    }
    
    func showHealPopUp(value: Int) {
        let damageLabel = FloatingLabel(text: "+\(value)", color: .green)
        damageLabel.position = CGPoint(x:  GameViewController.screenSize.width * 0.31, y: GameViewController.screenSize.height * 0.2)
        damageLabel.fontSize = self.size.width * 0.2
        addChild(damageLabel)
        
        // Animação para o número flutuante
        let moveAction = SKAction.move(by: CGVector(dx: 0, dy: 15), duration: 1.5) // Movimenta o número flutuante para cima
        let fadeOutAction = SKAction.fadeOut(withDuration: 3.0) // Desaparece com o número flutuante
        let removeAction = SKAction.removeFromParent() // Remove o número flutuante da cena
        
        let sequenceAction = SKAction.sequence([SKAction.group([moveAction, fadeOutAction]), removeAction])
        damageLabel.run(sequenceAction)
    }
}

class FloatingLabel: SKLabelNode {
    
    init(text: String, color: UIColor) {
        super.init()
        self.text = text
        self.fontName = "BreeSerif-Regular"
        self.fontColor = color
        self.zPosition = 0
        
        let containerNode = SKEffectNode()
        containerNode.zPosition = -1
        
        var widthShadow = self.frame.width
        if self.frame.width > 100  {
            widthShadow -= 20
        }
        
        let ellipseNode = SKShapeNode(ellipseOf: CGSize(width: widthShadow, height: self.frame.height))
        ellipseNode.fillColor = .black
        ellipseNode.alpha = 0.9 // Adjust the opacity of the ellipse as desired
        
        let blurFilter = CIFilter(name: "CIGaussianBlur")
        blurFilter?.setValue(15, forKey: "inputRadius") // Adjust the blur radius as desired
        containerNode.filter = blurFilter
        
        containerNode.addChild(ellipseNode)
        containerNode.position = CGPoint(x: 0, y: self.frame.height * 0.25)
        
        self.addChild(containerNode)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
