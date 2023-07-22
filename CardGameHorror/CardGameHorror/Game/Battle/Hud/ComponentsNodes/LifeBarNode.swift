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
    let backGround: LifeBarBackGround
    let lifeBar: LifeBar
    init(lifeBarName: String, life: Double, defaultLife: Double) {
        
        self.life = life
        self.defaultLife = defaultLife
        self.lifeBarName = lifeBarName
        
        self.lifeBar = LifeBar(lifeBarTexture: lifeBarName)
        
        backGround = LifeBarBackGround(life: life, defaultLife: defaultLife)
        
        super.init()
        print(life)
        backGround.scale(to: autoScale(backGround, widthProportion: 0.231, screenSize: GameViewController.screenSize))
        
        self.backGround.anchorPoint = CGPoint(x: 0.027, y: 0) // Ancoragem na extremidade esquerda do backGround
        self.lifeBar.anchorPoint = CGPoint(x: 1.0, y:  -0.55)
        
        lifeBar.zPosition = 1
        backGround.addChild(lifeBar)
        addChild(backGround)
        
        updateLifeBar()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateLifeBar() {
        let scaleAction = SKAction.scaleX(to: -CGFloat(life / defaultLife), duration: 0.3)
        
        let makeVisible = SKAction.sequence([SKAction.fadeAlpha(to: 0.5, duration: 0.6), SKAction.fadeAlpha(to: 1.0, duration: 0.6)])
        
        let groupAction = SKAction.group([scaleAction, makeVisible])
        
        backGround.updateLifeBar(hp: life)
        lifeBar.run(groupAction)
    }
    
    func setLife(_ life: Double) {
        self.life = life
        updateLifeBar()
    }
}
