//
//  HudNode.swift
//  CardGameHorror
//
//  Created by Eduardo on 18/07/23.
//

import Foundation
import SpriteKit

class Hud: SKNode {
    
    let monsterHud = MonsterHud()
    let bottom = BottomDivader()
    
    override init() {
        super.init()
        addChild(bottom)
        monsterHud.zPosition = 10
        addChild(monsterHud)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
