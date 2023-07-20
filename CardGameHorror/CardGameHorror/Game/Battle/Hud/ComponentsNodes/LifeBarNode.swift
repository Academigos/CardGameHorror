//
//  LifeBarNode.swift
//  CardGameHorror
//
//  Created by Eduardo on 19/07/23.
//

import Foundation
import SpriteKit

class LifeBarNode: SKNode{
    let lifeBarName: String
    var life: Double
    let defaultLife: Double
    let backGround = LifeBarBackGround()
    let lifeBar: LifeBar
    init(lifeBarName: String, life: Double, defaultLife: Double) {
        
        self.life = life
        self.defaultLife = defaultLife
        self.lifeBarName = lifeBarName
        
        self.lifeBar = LifeBar(lifeBarTexture: lifeBarName)
        
        super.init()
        print(life)
        backGround.scale(to: autoScale(backGround, widthProportion: 0.231, screenSize: GameViewController.screenSize))
        
        lifeBar.anchorPoint = CGPoint(x: -0.03, y: -0.55)
        backGround.anchorPoint = CGPoint(x: 0, y: 0)
        lifeBar.zPosition = 1
        backGround.addChild(lifeBar)
        addChild(backGround)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateLifeBar() {
        let scaleAction = SKAction.scaleX(to: CGFloat(life / defaultLife), duration: 0.3)
        let positionAction = SKAction.moveTo(x: 1, duration: 0.3)
        let groupAction = SKAction.group([scaleAction, positionAction])
        lifeBar.run(groupAction)
    }
    
    func setLife(_ life: Double) {
        self.life = life
        updateLifeBar()
    }
    
}
