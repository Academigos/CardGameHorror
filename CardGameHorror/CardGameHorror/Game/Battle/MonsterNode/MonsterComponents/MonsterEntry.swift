//
//  MonsterEntry.swift
//  CardGameHorror
//
//  Created by Giovanni Favorin de Melo on 18/07/23.
//

import SpriteKit

class MonsterEntry: SKNode {
    private var mistTextureLeft: [SKTexture] = [
        SKTexture(imageNamed: "nevoa_esquerda_1"),
        SKTexture(imageNamed: "nevoa_esquerda_2"),
        SKTexture(imageNamed: "nevoa_esquerda_3"),
        SKTexture(imageNamed: "nevoa_esquerda_4"),
        SKTexture(imageNamed: "nevoa_esquerda_5"),
        SKTexture(imageNamed: "nevoa_esquerda_6")
    ]
    
    private var mistTextureRight: [SKTexture] = [
        SKTexture(imageNamed: "nevoa_direita_1"),
        SKTexture(imageNamed: "nevoa_direita_2"),
        SKTexture(imageNamed: "nevoa_direita_3"),
        SKTexture(imageNamed: "nevoa_direita_4"),
        SKTexture(imageNamed: "nevoa_direita_5"),
        SKTexture(imageNamed: "nevoa_direita_6")
    ]
    
    private var mistLeft: SKSpriteNode
    private var mistRight: SKSpriteNode
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("NSCoding not supported")
    }
    
    override init() {
        mistLeft = SKSpriteNode(texture: mistTextureLeft[0])
        mistRight = SKSpriteNode(texture: mistTextureRight[0])
        
        super.init()
        
        position = CGPoint(x: GameViewController.screenSize.width * 0.5, y: GameViewController.screenSize.height * 0.47)
    
        animateMist()
    }
  
    private func animateMist() {
        mistLeft.position.x = GameViewController.screenSize.width * -0.235
        mistLeft.scale(to: autoScale(mistLeft, widthProportion: 0.53, screenSize: GameViewController.screenSize))
        addChild(mistLeft)
        
        mistRight.position.x = GameViewController.screenSize.width * 0.235
        mistRight.scale(to: autoScale(mistRight, widthProportion: 0.53, screenSize: GameViewController.screenSize))
        addChild(mistRight)
        
        let animationActionLeft = SKAction.animate(with: mistTextureLeft, timePerFrame: 0.1)
        let animationActionRight = SKAction.animate(with: mistTextureRight, timePerFrame: 0.1)
        
        let loopActionLeft = SKAction.repeatForever(animationActionLeft)
        let loopActionRight = SKAction.repeatForever(animationActionRight)
        
        mistLeft.run(loopActionLeft)
        mistRight.run(loopActionRight)
        
        animateMove()
    }
    
    func animateMove() {
        let moveDistance: CGFloat = 500.0

        // Ação de movimento para o elemento de cena da esquerda
        let moveLeftAction = SKAction.moveBy(x: -moveDistance, y: 0, duration: 2.0)
        let moveRightAction = SKAction.moveBy(x: moveDistance, y: 0, duration: 2.0)

        let removeFromParent = SKAction.removeFromParent()
        
        let waitAction = SKAction.wait(forDuration: 1.5)
        let leftSequence = SKAction.sequence([waitAction, moveLeftAction, removeFromParent])


        let rightSequence = SKAction.sequence([waitAction, moveRightAction, removeFromParent])

        mistLeft.run(leftSequence)
        mistRight.run(rightSequence)
    }
    
    func stopAnimation() {
        removeAllActions()
    }
}
