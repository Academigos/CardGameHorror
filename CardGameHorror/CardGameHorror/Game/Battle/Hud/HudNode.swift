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
    let endTurnButtom = ButtonEndTurn()
    let stackpopup = FloatingNode()

    let divader = Divader()
    let camera = Camera()
    let cameraNode = SKCameraNode()

    override init() {
        super.init()
        endTurnButtom.stackPopUp = stackpopup
        endTurnButtom.position = CGPoint(x: GameViewController.screenSize.width * 0.15, y: GameViewController.screenSize.height * -0.18)
        endTurnButtom.scale(to: autoScale(endTurnButtom, widthProportion: 0.14, screenSize: GameViewController.screenSize))
        endTurnButtom.zPosition = 90
        addChild(endTurnButtom)
        // animação endTurnButtom entrada
        let finalPositionEndTurnButtom = CGPoint(x: GameViewController.screenSize.width * 0.85, y: GameViewController.screenSize.height * 0.18)
        // Crie uma ação para mover o nó de sua posição inicial até a posição final
        let moveActionEndTurnButtom = SKAction.moveTo(y: finalPositionEndTurnButtom.y, duration: 0.5)
        endTurnButtom.run(moveActionEndTurnButtom)
        
        
        camera.position = CGPoint(x: GameViewController.screenSize.width * 0.5, y: GameViewController.screenSize.height * 0.5)
        camera.zPosition = 0
        addChild(camera)
        
        divader.position = CGPoint(x: GameViewController.screenSize.width * 0.5, y: GameViewController.screenSize.height * 0.15)
        divader.zPosition = 80
        addChild(divader)
        // animação divider entrada
        let finalPositionDiviser = CGPoint(x: GameViewController.screenSize.width * 0.5, y: GameViewController.screenSize.height * 0.15)
        // Crie uma ação para mover o nó de sua posição inicial até a posição final
        let moveActionDiviser = SKAction.moveTo(y: finalPositionDiviser.y, duration: 0.5)
        divader.run(moveActionDiviser)
        
        playerHud.zPosition = 90
        addChild(playerHud)
        // animação playerHud entrada
        let finalPositionPlayer = playerHud.position.y
        playerHud.position.y = GameViewController.screenSize.height * -0.087
        // Crie uma ação para mover o nó de sua posição inicial até a posição final
        let moveActionPlayer = SKAction.moveTo(y: finalPositionPlayer, duration: 0.5)
        playerHud.run(moveActionPlayer)
        
        monsterHud.zPosition = 90
        addChild(monsterHud)
        
        pause.zPosition = 100
        addChild(pause)
        
        stackpopup.zPosition = 100
        addChild(stackpopup)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateLife() {
        if playerHud.playerLifeBar.life != DataManager.shared.fetchPlayer().hp {
            self.playerHud.updatePlayer(value: DataManager.shared.fetchPlayer().hp)
        }
 
        self.monsterHud.updateMonster(value: DataManager.shared.fetchMonster().hp)
        
        var damageMonster = 0
        if DataManager.shared.fetchMonster().hp > 0{
            damageMonster = GameController.shared.monsterTurn()
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            if damageMonster != 0 {
                self.stackpopup.showDamagePopUp(at: CGPoint(x:  GameViewController.screenSize.width * 0.75, y: GameViewController.screenSize.height * 0.2), value: damageMonster)
            }
            
            if self.playerHud.playerLifeBar.life != DataManager.shared.fetchPlayer().hp {
                self.playerHud.updatePlayer(value: DataManager.shared.fetchPlayer().hp)
            }
        }
    }
    func resetLife() {
        if playerHud.playerLifeBar.life != DataManager.shared.fetchPlayer().hp {
            self.playerHud.updatePlayer(value: DataManager.shared.fetchPlayer().hp)
        }
        self.monsterHud.updateMonster(value: DataManager.shared.fetchMonster().hp)

        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            if self.playerHud.playerLifeBar.life != DataManager.shared.fetchPlayer().hp {
                self.playerHud.updatePlayer(value: DataManager.shared.fetchPlayer().hp)
            }
        }
    }
}
