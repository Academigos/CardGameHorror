//
//  DefeatKaylaWaking.swift
//  CardGameHorror
//
//  Created by Eduardo on 04/08/23.
//

import Foundation
import SpriteKit

class DefeatKayla: SKScene {
    
    override func didMove(to view: SKView) {
        // Carregar o atlas
        let atlas = SKTextureAtlas(named: "KaylaDerrota")
        
        // Adicione manualmente os nomes das texturas na ordem desejada
        let sortedTextureNames = [
            "prologo_derrota_01",
            "prologo_derrota_02",
            "prologo_derrota_03",
            "prologo_derrota_04",
            "prologo_derrota_05",
            "prologo_derrota_06",
            "prologo_derrota_07",
            "prologo_derrota_08",
            "prologo_derrota_09",
            "prologo_derrota_10",
            "prologo_derrota_11",
            "prologo_derrota_12",
            "prologo_derrota_13",
            "prologo_derrota_14",
            "prologo_derrota_15",
            "prologo_derrota_16",
            "prologo_derrota_17",
            "prologo_derrota_18",
            "prologo_derrota_19",
            "prologo_derrota_20",
            "prologo_derrota_21",
            "prologo_derrota_22",
            "prologo_derrota_23",
            "prologo_derrota_24",


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
        animatedBackground.scale(to: GameViewController.screenSize)
        addChild(animatedBackground)
        
        // Criar a ação de animação
        let animationAction = SKAction.animate(with: textures, timePerFrame: 0.1)
        animationAction.timingMode =  .easeOut
        animationAction.duration = 2.3
        
        let delay = SKAction.wait(forDuration: 1)
        
        let sequence = SKAction.sequence([delay, animationAction])
        
        animatedBackground.run(sequence) {
            let transition = SKTransition.crossFade(withDuration: 1.0)
            let gameScene = MonsterEnd(size: GameViewController.screenSize)
            self.view?.presentScene(gameScene, transition: transition)
        }
    }
    
}
