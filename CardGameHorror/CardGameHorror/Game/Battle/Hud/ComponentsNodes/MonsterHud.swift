//
//  MonsterHud.swift
//  CardGameHorror
//
//  Created by Eduardo on 19/07/23.
//

import Foundation
import SpriteKit

class MonsterHud: SKNode{
    let monsterLifeBar = LifeBarNode(lifeBarName: "MonsterLifeBar", life: DataManager.shared.fetchMonster().hp, defaultLife: GameController.shared.monsterLife)
    let monsterName = NamePlaceHolder(texture: "Trauma")
    var label: SKLabelNode = SKLabelNode()
    override init() {
        super.init()
        monsterName.scale(to: autoScale(monsterName, widthProportion: 0.12, screenSize: GameViewController.screenSize))
        monsterName.position = CGPoint (x: GameViewController.screenSize.width * 0.258, y: GameViewController.screenSize.height * 0.77)
        monsterLifeBar.position = CGPoint (x: GameViewController.screenSize.width * 0.14, y: GameViewController.screenSize.height * 0.83)
        addChild(monsterName)
        addChild(monsterLifeBar)
        
        setupValueLabel()
    }
    private func setupValueLabel() {
        label.name = "labelTrauma"
        label.fontSize = monsterName.size.height * 1.5
        label.fontName = "BigshotOne-Regular"
        label.fontColor = SKColor(red: 129/255, green: 134/255, blue: 150/255, alpha: 1.0)
        label.text = LanguageManager.shared.localizedString("Trauma")
        label.position = CGPoint(x: 0, y: -10)
        label.zPosition = 1.0
        
        monsterName.addChild(label)
    }
    
    func updateMonster(value: Double){
        monsterLifeBar.setLife(DataManager.shared.fetchMonster().hp)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
