//
//  PlayerEndScene.swift
//  CardGameHorror
//
//  Created by Eduardo on 23/07/23.
//

import SpriteKit

///Classe para  a cena em que o player ganha
class PlayerEnd: SKScene{
    let finalScene = FinalSceneVitoria()//cena final (background e label)
    let vitoriaMusic = SKAudioNode(fileNamed: "vitoria_msc")
    override func didMove(to view: SKView) {
        finalScene.zPosition=0
        addChild(finalScene)
        addChild(vitoriaMusic)
    }
}
