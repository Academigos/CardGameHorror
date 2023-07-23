//
//  TextBox.swift
//  CardGameHorror
//
//  Created by Giovanni Favorin de Melo on 23/07/23.
//

import SpriteKit

enum TextBoxType: Int {
    case cayla,
    cartomante
}

class TextBox: SKSpriteNode {
    let textBoxType: TextBoxType
    let textBoxTexture: SKTexture

    required init?(coder aDecoder: NSCoder) {
        fatalError("NSCoding not supported")
    }

    init(textBoxType: TextBoxType) {
        self.textBoxType = textBoxType
        
        switch textBoxType {
        case .cayla:
            textBoxTexture = SKTexture(imageNamed: "textbox_cayla")
        case .cartomante:
            textBoxTexture = SKTexture(imageNamed: "textbox_cartomante")
        }

        super.init(texture: textBoxTexture, color: UIColor.clear, size: textBoxTexture.size())
        self.position = CGPoint(x: GameViewController.screenSize.width * 0.5, y: GameViewController.screenSize.height * 0.5)
        self.scale(to: autoScale(self, widthProportion: 0.8, screenSize: GameViewController.screenSize))
        zPosition = 2
    }
}
