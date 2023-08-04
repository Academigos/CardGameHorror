//
//  MonsterEndScene.swift
//  CardGameHorror
//
//  Created by Eduardo on 23/07/23.
//

import Foundation
import SpriteKit

class MonsterEnd: SKScene{
    let finalScene = FinalSceneDerrota()
    let derrotaMusic = SKAudioNode(fileNamed: "derrota_bgm")
    
    
    override func didMove(to view: SKView) {
        addChild(finalScene)
        addChild(derrotaMusic)
    }
}
