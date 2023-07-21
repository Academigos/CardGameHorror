//
//  MainMenu.swift
//  CardGameHorror
//
//  Created by Eduardo on 21/07/23.
//

import Foundation
import SpriteKit

class MainMenu: SKSpriteNode{
     let mainMenu: SKTexture
    init() {
        self.mainMenu = SKTexture(imageNamed: "MainMenu")
        super.init(texture: mainMenu, color: .clear, size: mainMenu.size())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
}
