//
//  PlayerHud.swift
//  CardGameHorror
//
//  Created by Eduardo on 19/07/23.
//

import Foundation
import SpriteKit

class PlayerHud: SKNode {
    let playerLifeBar = LifeBarNode(lifeBarName: "PlayerLifeBar", life: DataManager.shared.fetchPlayer().hp, defaultLife: GameController.shared.playerLife)
    let playerName = NamePlaceHolder(texture: "Courage")
    var label: SKLabelNode = SKLabelNode()
    override init() {
        super.init()
        playerLifeBar.position = CGPoint (x: GameViewController.screenSize.width * 0.70 , y: GameViewController.screenSize.height * 0.087)
        playerName.scale(to: autoScale(playerName, widthProportion: 0.12, screenSize: GameViewController.screenSize))
        playerName.position = CGPoint (x: GameViewController.screenSize.width * 0.87 , y: GameViewController.screenSize.height * 0.19)
        addChild(playerName)
        addChild(playerLifeBar)
        
    }
    

    
    func updatePlayer(value: Double) {
        playerLifeBar.setLife(DataManager.shared.fetchPlayer().hp)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
