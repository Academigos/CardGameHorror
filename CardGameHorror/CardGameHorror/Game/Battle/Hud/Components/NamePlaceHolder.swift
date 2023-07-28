//
//  NamePlaceHolder.swift
//  CardGameHorror
//
//  Created by Eduardo on 19/07/23.
//

import Foundation
import SpriteKit

class NamePlaceHolder: SKSpriteNode{
    let textureName: SKTexture
    var label: SKLabelNode = SKLabelNode()
    let text: String
    init(texture: String) {
        self.text = texture
        self.textureName = SKTexture(imageNamed: texture)
        super.init(texture: textureName, color: .clear, size: textureName.size())
        setupValueLabel()

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setupValueLabel() {
        label.name = "labelTrauma"
        label.fontSize = self.size.height * 0.6
        label.fontName = "BigshotOne-Regular"
        label.fontColor = SKColor(red: 129/255, green: 134/255, blue: 150/255, alpha: 1.0)
        if text == "Trauma"{
            label.text = LanguageManager.shared.localizedString("Trauma")
        }else{
            label.text = LanguageManager.shared.localizedString("Coragem")

        }
        label.position = CGPoint(x: 0, y: -10)
        label.zPosition = 1.0
        
        self.addChild(label)
    }
}
