//
//  MonsterEntity.swift
//  CardGameHorror
//
//  Created by Giovanni Favorin de Melo on 18/07/23.
//

import SpriteKit

class Enemy: SKSpriteNode {
    let enemyTexture:SKTexture
    // Adicione mais texturas aqui para os outros quadros da animação
    let idleTexture:[SKTexture] = [
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
    //let enemyFlavorTexr: SKLabelNode
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("NSCoding not supported")
    }
    
    init() {
        enemyTexture = SKTexture(imageNamed: "bebadoIdle1")
        
        super.init(texture: enemyTexture, color: UIColor.clear, size: enemyTexture.size())
    }
    
    
    
    func attacking() {
        //        let frameChanges
        // mudança na tela
        // Fala do inimigo
    }
    
    func takingDamage() {
        let scaleOut = SKAction.fadeOut(withDuration: 1.0)
        self.run(scaleOut)
    }
    
    func idle() {
        let animationAction = SKAction.animate(with: idleTexture, timePerFrame: 0.1)
        
        // Crie uma ação de loop infinito usando a ação de animação
        let loopAction = SKAction.repeatForever(animationAction)
        self.run(loopAction)
    }
    
    func startRotationAnimation() {
        let rotateAction = SKAction.rotate(byAngle: .pi, duration: 1.0)
        let repeatAction = SKAction.repeatForever(rotateAction)
        self.run(repeatAction)
    }
}
