//
//  MonsterEntity.swift
//  CardGameHorror
//
//  Created by Giovanni Favorin de Melo on 18/07/23.
//

import SpriteKit

class Enemy: SKSpriteNode {
    let enemyTexture: SKTexture
    //let enemyFlavorTexr: SKLabelNode
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("NSCoding not supported")
    }
    
    init() {
        enemyTexture = SKTexture(imageNamed: "Monstro")
        
        super.init(texture: enemyTexture, color: UIColor.clear, size: enemyTexture.size())
    }
    
    func startRotationAnimation() {
        let rotateAction = SKAction.rotate(byAngle: .pi, duration: 1.0)
        let repeatAction = SKAction.repeatForever(rotateAction)
        self.run(repeatAction)
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
        let rotateAction = SKAction.rotate(byAngle: .pi, duration: 1.0)
        let repeatAction = SKAction.repeatForever(rotateAction)
        self.run(repeatAction)
    }
}
