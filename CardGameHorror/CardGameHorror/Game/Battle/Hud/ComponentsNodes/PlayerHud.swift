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
        playerLifeBar.position = CGPoint (x: GameViewController.screenSize.width * 0.20 , y: GameViewController.screenSize.height * 0.087)
        playerName.scale(to: autoScale(playerName, widthProportion: 0.12, screenSize: GameViewController.screenSize))
        playerName.position = CGPoint (x: GameViewController.screenSize.width * 0.12 , y: GameViewController.screenSize.height * 0.12)
        addChild(playerName)
        addChild(playerLifeBar)
        
        setupValueLabel()
    }
    
    private func setupValueLabel() {
        label.name = "labelTrauma"
        label.fontSize = playerName.size.height * 1.5
        label.fontName = "BigshotOne-Regular"
        label.fontColor = SKColor(red: 129/255, green: 134/255, blue: 150/255, alpha: 1.0)
        label.text = LanguageManager.shared.localizedString("Coragem")
        label.position = CGPoint(x: 0, y: -10)
        label.zPosition = 1.0
        
        playerName.addChild(label)
    }
    
    func updatePlayer(value: Double) {
        playerLifeBar.setLife(DataManager.shared.fetchPlayer().hp)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
