//
//  MonsterHud.swift
//  CardGameHorror
//
//  Created by Eduardo on 19/07/23.
//

import SpriteKit

///Classe para controlar os dados do monstro
class MonsterHud: SKNode{
    let monsterLifeBar = LifeBarNode(lifeBarName: "MonsterLifeBar", life: DataManager.shared.fetchMonster().hp, defaultLife: GameController.shared.monsterLife)
    let monsterName = NamePlaceHolder(texture: "Trauma")
   
    override init() {
        super.init()
        monsterName.scale(to: autoScale(monsterName, widthProportion: 0.12, screenSize: GameViewController.screenSize))
        monsterName.position = CGPoint (x: GameViewController.screenSize.width * 0.12, y: GameViewController.screenSize.height * 0.77)
        monsterLifeBar.position = CGPoint (x: GameViewController.screenSize.width * 0.06, y: GameViewController.screenSize.height * 0.83)
        addChild(monsterName)
        addChild(monsterLifeBar)
    }
    
    func updateMonster(value: Double){
        monsterLifeBar.setLife(DataManager.shared.fetchMonster().hp)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
