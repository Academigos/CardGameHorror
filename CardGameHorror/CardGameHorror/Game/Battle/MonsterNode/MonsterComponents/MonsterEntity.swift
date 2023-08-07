//
//  MonsterEntity.swift
//  CardGameHorror
//
//  Created by Giovanni Favorin de Melo on 18/07/23.
//

import SpriteKit

///Classe para definir o comportamento do inimigo 
class Enemy: SKSpriteNode {
    private let enemyTexture:SKTexture
    // Adicione mais texturas aqui para os outros quadros da animação
    private let idleTexture:[SKTexture] = [
        SKTexture(imageNamed: "bebadoIdle1"),
        SKTexture(imageNamed: "bebadoIdle2"),
        SKTexture(imageNamed: "bebadoIdle3"),
        SKTexture(imageNamed: "bebadoIdle4"),
        SKTexture(imageNamed: "bebadoIdle5"),
        SKTexture(imageNamed: "bebadoIdle6"),
        SKTexture(imageNamed: "bebadoIdle7"),
        SKTexture(imageNamed: "bebadoIdle8"),
        SKTexture(imageNamed: "bebadoIdle9"),
        SKTexture(imageNamed: "bebadoIdle10"),
        SKTexture(imageNamed: "bebadoIdle11"),
        // Adicione mais texturas aqui para os outros quadros da animação
    ]
    private let attackTexture:[SKTexture] = [
        SKTexture(imageNamed: "ataque1"),
        SKTexture(imageNamed: "ataque2"),
        SKTexture(imageNamed: "ataque3"),
        SKTexture(imageNamed: "ataque4"),
        SKTexture(imageNamed: "ataque5")
    ]
    //let enemyFlavorTexr: SKLabelNode
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("NSCoding not supported")
    }
    
    init() {
        enemyTexture = SKTexture(imageNamed: "bebadoIdle1")
        
        super.init(texture: enemyTexture, color: UIColor.clear, size: enemyTexture.size())
    }
    
    func attacking() {
        // Ação de animação de ataque
        let attackAction = SKAction.sequence([SKAction.animate(with: attackTexture, timePerFrame: 0.1), SKAction.run {
            self.setupCamera()
        }, SKAction.wait(forDuration: 0.5)])
        
        // Ação de escala para aumentar o tamanho do nó (usando o SKAction.scale(by:))
        let scaleUpAction = SKAction.scale(by: 1.5, duration: 0.5)
        
        // Movendo o nó verticalmente para baixo
        let moveDownAction = SKAction.moveBy(x: 0, y: -50, duration: 0.5) // Ajuste o valor do y conforme necessário para controlar a posição vertical
        
        // Movendo o nó verticalmente para cima (voltando à posição original)
        let moveUpAction = SKAction.moveBy(x: 0, y: 50, duration: 0.5) // Usamos o mesmo valor de y, mas negativo, para voltar à posição original
        
        // Ação de escala para restaurar o tamanho original do nó
        let scaleDownAction = SKAction.scale(to: autoScale( self, widthProportion: 0.19, screenSize: GameViewController.screenSize), duration: 0.8)
        
        // Sequência de ações para aumentar, mover para baixo, mover para cima, restaurar o tamanho do nó durante o ataque
        let scaleMoveSequence = SKAction.group([scaleUpAction, moveDownAction])
        let scaleMoveWaitMoveSequence = SKAction.sequence([scaleMoveSequence, SKAction.wait(forDuration: 0.5)])
        let returning = SKAction.group([scaleDownAction, moveUpAction])
        let scaleMoveWaitMoveAndRestoreSequence = SKAction.sequence([scaleMoveWaitMoveSequence, attackAction, returning])
        
        // Sequência de ações completa: animação de ataque + animação idle
        let sequenceAction = SKAction.sequence([scaleMoveWaitMoveAndRestoreSequence, SKAction.run { [weak self] in
            self?.idle()
        }])
        
        self.run(sequenceAction)
    }
    
    func takingDamage() {
        // Verifica se há pelo menos uma carta no array com type igual a "ATK"
        let hasATKCard = GameController.shared.selectedCard.contains { card in
            return card.type == "ATK"
        }
        
        if DataManager.shared.fetchMonster().hp <= 0 {
            return
        }
        
        // Animação de tremer
        if hasATKCard {
            let shakeAction = SKAction.sequence([
                SKAction.scale(to: autoScale(self, widthProportion: 0.16, screenSize: GameViewController.screenSize), duration: 0.1),
                SKAction.scale(to: autoScale(self, widthProportion: 0.14, screenSize: GameViewController.screenSize), duration: 0.2),
                SKAction.scale(to: autoScale(self, widthProportion: 0.16, screenSize: GameViewController.screenSize), duration: 0.1),
                SKAction.scale(to: autoScale(self, widthProportion: 0.14, screenSize: GameViewController.screenSize), duration: 0.2),
                SKAction.scale(to: autoScale(self, widthProportion: 0.19, screenSize: GameViewController.screenSize), duration: 0.1),
                SKAction.wait(forDuration: 1.0),
                SKAction.run { [weak self] in
                    self?.attacking()
                }
            ])
            
            self.run(shakeAction)
            
        } else {
            let attacking = SKAction.run { [weak self] in
                self?.attacking()
            }
            
            self.run(SKAction.sequence([SKAction.wait(forDuration: 1.0), attacking]))
        }
        
        idle()
    }
    
    func dying() {
        let fadeOutAction = SKAction.fadeOut(withDuration: 1.0)
        self.run(fadeOutAction)
        idle()
    }
    
    func idle() {
        let animationAction = SKAction.animate(with: idleTexture, timePerFrame: 0.5)
        
        let loopAction = SKAction.repeatForever(animationAction)
        self.run(loopAction)
    }
    
    func fadeIn() {
        // Defina a opacidade inicial para 0
        alpha = 0.0
        // Crie uma ação de espera de 1 segundo antes de iniciar a animação de fade in
        let waitAction = SKAction.wait(forDuration: 1.5)
        
        // Crie uma ação de fade in que altera a opacidade para 1 (totalmente visível) durante a duração especificada
        let fadeInAction = SKAction.fadeIn(withDuration: 1.0)
        
        // Crie uma sequência de ações para realizar o atraso e, em seguida, o fade in
        let sequenceAction = SKAction.sequence([waitAction, fadeInAction])
        run(sequenceAction)
    }
    
    func setupCamera() {
        let cameraNode = SKCameraNode()
        self.scene?.camera = cameraNode
        cameraNode.position = CGPoint(x: GameViewController.screenSize.width * 0.5, y: GameViewController.screenSize.height * 0.5)
        self.scene?.addChild(cameraNode)
        
        shakeCameraWithZoom(duration: 0.5, zoomFactor: 0.977)
    }


    func shakeCameraWithZoom(duration: Float, zoomFactor: CGFloat) {
        let amplitudeX: CGFloat = 40.0
        let amplitudeY: CGFloat = 15.0
        let numberOfShakes = Int(duration / 0.04)
        var shakeActionsArray: [SKAction] = []
        // Zoom in action
        let initialZoom = self.scene?.camera?.xScale ?? 1.0
        let zoomInAction = SKAction.scale(to: initialZoom * zoomFactor, duration: 0.1)
        
        // Shake actions
        for _ in 1...numberOfShakes {
            let shakeX = CGFloat(arc4random_uniform(UInt32(amplitudeX))) - amplitudeX / 2
            let shakeY = CGFloat(arc4random_uniform(UInt32(amplitudeY))) - amplitudeY / 2
            let shakeAction = SKAction.moveBy(x: shakeX, y: shakeY, duration: 0.02)
            shakeAction.timingMode = .easeOut
            
            shakeActionsArray.append(shakeAction)
            shakeActionsArray.append(shakeAction.reversed())
            let impactFeedbackGenerator = UIImpactFeedbackGenerator(style: .heavy)
            impactFeedbackGenerator.prepare()
            impactFeedbackGenerator.impactOccurred()
        }
        
        let shakeSequence = SKAction.sequence(shakeActionsArray)
        
        // Zoom out action
        let zoomOutAction = SKAction.scale(to: initialZoom, duration: 0.1)
        
        // Sequence: Zoom in -> Shake -> Zoom out
        let fullSequence = SKAction.sequence([zoomInAction, shakeSequence, zoomOutAction])
        self.scene?.camera?.run(fullSequence) {
            self.scene?.camera?.removeFromParent()
        }
    }
}
