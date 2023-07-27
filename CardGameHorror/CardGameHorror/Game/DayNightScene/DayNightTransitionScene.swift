//
//  NewScene.swift
//  CardGameHorror
//
//  Created by Erick Ribeiro on 24/07/23.
//

import SpriteKit

class DayNightTransitionScene: SKScene {
    
    override func didMove(to view: SKView) {
        // Carregar o atlas
        let atlas = SKTextureAtlas(named: "daynight")
        
        // Adicione manualmente os nomes das texturas na ordem desejada
        let sortedTextureNames = [
            "transição_1",
            "transição_2",
            "transição_3",
            "transição_4",
            "transição_5",
            "transição_6",
            "transição_7",
            "transição_8",
            "transição_9",
            "transição_10",
            "transição_11",
            "transição_12",
            "transição_13",
            "transição_14",
            "transição_15",
            "transição_16"
        ]
        
        // Criar uma array para armazenar as texturas do atlas na ordem especificada
        var textures: [SKTexture] = []
        
        // Adicionar as texturas do atlas na ordem especificada e duplicar cada frame
        for frameName in sortedTextureNames {
            let texture = atlas.textureNamed(frameName)
            textures.append(texture)
//
//            // Duplicar o frame para tornar a animação mais lenta
//            for _ in 0..<6 { // Neste exemplo, cada frame é duplicado 3 vezes
//                textures.append(texture)
//            }
        }
        
        // Criar um sprite para o fundo animado
        let animatedBackground = SKSpriteNode(texture: textures.first)
        animatedBackground.position = CGPoint(x: size.width / 2, y: size.height / 2)
        addChild(animatedBackground)
        
        // Criar a ação de animação
        let animationAction = SKAction.animate(with: textures, timePerFrame: 0.1)
        animationAction.timingMode =  .easeOut
        animationAction.duration = 2.6
        
        let delay = SKAction.wait(forDuration: 1.5)
        
        let sequence = SKAction.sequence([delay, animationAction])
        
        animatedBackground.run(sequence) {
            let transition = SKTransition.crossFade(withDuration: 1.0)
            let gameScene = GameScene(size: GameViewController.screenSize)
            self.view?.presentScene(gameScene, transition: transition)
        }
    }
    
}
