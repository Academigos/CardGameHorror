//
//  MonsterEndScene.swift
//  CardGameHorror
//
//  Created by Eduardo on 23/07/23.
//

import Foundation
import SpriteKit

class MonsterEnd: SKScene{
    let kaylaWakingDefeat = KaylaWaking(imagem0: "prologo_derrota_1", imagens: "prologo_derrota_", pasta: "KaylaDerrota")
    let finalScene = FinalSceneDerrota()
    
    override func didMove(to view: SKView) {
        kaylaWakingDefeat.scale(to: GameViewController.screenSize)
        kaylaWakingDefeat.position = CGPoint(x: GameViewController.screenSize.width*0.5, y: GameViewController.screenSize.height*0.5)
        addChild(kaylaWakingDefeat)
        let delay = SKAction.wait(forDuration: 3)
        let fadeout = SKAction.sequence([delay,.fadeOut(withDuration: 1)])
        kaylaWakingDefeat.run(fadeout)
        
        finalScene(resultado: finalScene)
        
        //addChild(finalScene)
    }
    
    func finalScene(resultado:SKNode){
        let delayTime: TimeInterval = 3.0 // 3 segundos
        Timer.scheduledTimer(withTimeInterval: delayTime, repeats: false) { timer in
            let delay = SKAction.wait(forDuration: 0)
            let transicao = SKAction.sequence([SKAction.fadeAlpha(to: 0, duration: 0),delay, SKAction.fadeAlpha(to: 1.0, duration: 3)])
            self.removeAllChildren()
            self.addChild(resultado)
            resultado.run(transicao)
            
        }
        
    }
}
