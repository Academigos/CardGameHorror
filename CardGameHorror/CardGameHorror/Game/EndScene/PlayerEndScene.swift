//
//  PlayerEndScene.swift
//  CardGameHorror
//
//  Created by Eduardo on 23/07/23.
//

import Foundation
import SpriteKit

class PlayerEnd: SKScene{
    let kaylaWakingVictory = KaylaWaking(imagem0: "prologo_vitoria_1", imagens: "prologo_vitoria_", pasta: "KaylaVitoria")// animacao
    let finalScene = FinalSceneVitoria()//cena final (background e label)
    let vitoriaMusic = SKAudioNode(fileNamed: "vitoria_msc")
    override func didMove(to view: SKView) {
        kaylaWakingVictory.position = CGPoint(x: GameViewController.screenSize.width*0.5, y: GameViewController.screenSize.height*0.5)
        finalScene.zPosition=0
        let delay = SKAction.wait(forDuration: 3)
        let fadeout = SKAction.sequence([delay,.fadeOut(withDuration: 1)])
        kaylaWakingVictory.scale(to: GameViewController.screenSize)
        addChild(kaylaWakingVictory)
        kaylaWakingVictory.run(fadeout)
        finalScene(resultado: finalScene)
        
    }
    
    
    //delay de 4 segundos
    func finalScene(resultado:SKNode){
        let delayTime: TimeInterval = 4.0
               Timer.scheduledTimer(withTimeInterval: delayTime, repeats: false) { timer in
                   let delay = SKAction.wait(forDuration: 0)
                   let transicao = SKAction.sequence([SKAction.fadeAlpha(to: 0, duration: 0),delay, SKAction.fadeAlpha(to: 1.0, duration: 3)])
                   
                   self.removeAllChildren()
                   self.addChild(resultado)
                   self.addChild(self.vitoriaMusic)
                   resultado.run(transicao)
               }
    }
    
    func addDialogo(){
        
    }
}
