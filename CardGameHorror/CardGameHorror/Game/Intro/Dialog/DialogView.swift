//
//  DialogView.swift
//  CardGameHorror
//
//  Created by Giovanni Favorin de Melo on 23/07/23.
//

import SpriteKit

class DialogView: SKNode {
    let scenary = IntroScenary(backgroundType: .desk)
    let textBox = TextBox(textBoxType: .cayla)
    
    override init() {
        super.init()
        
        addChild(scenary)
        addChild(textBox)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
