//
//  HudNode.swift
//  CardGameHorror
//
//  Created by Eduardo on 18/07/23.
//

import Foundation
import SpriteKit

class Hud: SKNode {
    let playerHud = PlayerHud()
    let monsterHud = MonsterHud()
    let pause = PauseNode()
    let endTurnButtom = ButtonEndTurn(buttomTexture: "EndTurn")

    let divader = Divader()
    let camera = Camera()
    override init() {
        super.init()
        endTurnButtom.position = CGPoint(x: GameViewController.screenSize.width * 0.85, y: GameViewController.screenSize.height * 0.18)
        endTurnButtom.scale(to: autoScale(endTurnButtom, widthProportion: 0.14, screenSize: GameViewController.screenSize))

        endTurnButtom.zPosition = 90
        addChild(endTurnButtom)
        
        
        camera.position = CGPoint(x: GameViewController.screenSize.width * 0.5, y: GameViewController.screenSize.height * 0.5)
        camera.zPosition = 0
        addChild(camera)
        
        divader.position = CGPoint(x: GameViewController.screenSize.width * 0.5, y: GameViewController.screenSize.height * 0.154)
        divader.zPosition = 80
        addChild(divader)
        
        playerHud.zPosition = 90
        addChild(playerHud)
        
        monsterHud.zPosition = 90

        endTurnButtom.zPosition = 10
        addChild(endTurnButtom)
        
   

        addChild(monsterHud)
        
        pause.zPosition = 100
        addChild(pause)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateLife() {
        if playerHud.playerLifeBar.life != DataManager.shared.fetchPlayer().hp {
            self.playerHud.updatePlayer(value: DataManager.shared.fetchPlayer().hp)
        }
 
        self.monsterHud.updateMonster(value: DataManager.shared.fetchMonster().hp)
        
        if DataManager.shared.fetchMonster().hp > 0{
            GameController.shared.monsterTurn()
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            if self.playerHud.playerLifeBar.life != DataManager.shared.fetchPlayer().hp {
                self.playerHud.updatePlayer(value: DataManager.shared.fetchPlayer().hp)
            }
        }
    }
    func resetLife(){
        if playerHud.playerLifeBar.life != DataManager.shared.fetchPlayer().hp {
            self.playerHud.updatePlayer(value: DataManager.shared.fetchPlayer().hp)
        }
        self.monsterHud.updateMonster(value: DataManager.shared.fetchMonster().hp)


        self.monsterHud.updateMonster(value: DataManager.shared.fetchMonster().hp)
        if DataManager.shared.fetchMonster().hp > 0{
            GameController.shared.monsterTurn()
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            if self.playerHud.playerLifeBar.life != DataManager.shared.fetchPlayer().hp {
                self.playerHud.updatePlayer(value: DataManager.shared.fetchPlayer().hp)
            }
        }
    }
}
