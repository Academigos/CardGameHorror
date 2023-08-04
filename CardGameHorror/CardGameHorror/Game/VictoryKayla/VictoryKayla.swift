//
//  VictoryKayla.swift
//  CardGameHorror
//
//  Created by Eduardo on 04/08/23.
//

import Foundation
import SpriteKit

class VictoryKayla: SKScene {
    
    override func didMove(to view: SKView) {
        // Carregar o atlas
        let atlas = SKTextureAtlas(named: "KaylaVitoria")
        
        // Adicione manualmente os nomes das texturas na ordem desejada
        let sortedTextureNames = [
            "prologo_vitoria_01",
            "prologo_vitoria_02",
            "prologo_vitoria_03",
            "prologo_vitoria_04",
            "prologo_vitoria_05",
            "prologo_vitoria_06",
            "prologo_vitoria_07",
            "prologo_vitoria_08",
            "prologo_vitoria_09",
            "prologo_vitoria_10",
            "prologo_vitoria_11",
            "prologo_vitoria_12",
            "prologo_vitoria_13",
            "prologo_vitoria_14",
            "prologo_vitoria_15",
            "prologo_vitoria_16",
            "prologo_vitoria_17",
            "prologo_vitoria_18",
            "prologo_vitoria_19",
            "prologo_vitoria_20",
            "prologo_vitoria_21",
            "prologo_vitoria_22",
            "prologo_vitoria_23",
            "prologo_vitoria_24",


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
            let gameScene = PlayerEnd(size: GameViewController.screenSize)
            self.view?.presentScene(gameScene, transition: transition)
        }
    }
    
}
