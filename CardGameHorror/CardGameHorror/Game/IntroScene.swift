//
//  IntroScene.swift
//  CardGameHorror
//
//  Created by Erick Ribeiro on 23/07/23.
//

import SpriteKit

class IntroScene: SKScene {
    var dialogView: DialogView? = DialogView()

    override init(size: CGSize) {
        super.init(size: size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMove(to view: SKView) {        
        addChild(dialogView!)
    }
    
}
