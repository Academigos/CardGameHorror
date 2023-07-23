//
//  PauseBackground.swift
//  CardGameHorror
//
//  Created by Eduardo on 21/07/23.
//

import Foundation
import SpriteKit


class PauseBackground: SKSpriteNode{
     let pauseBackGround: SKTexture
    weak var delegate: ClosePauseDelegate?
    var optionLabel: SKLabelNode = SKLabelNode()
    var languageLabel: SKLabelNode = SKLabelNode()
    var continueLabel: SKLabelNode = SKLabelNode()
    
    init() {
        self.pauseBackGround = SKTexture(imageNamed: "PauseBackground")
        super.init(texture: pauseBackGround, color: .clear, size: pauseBackGround.size())
        setUpOptionLabel()
        setUpContinueLabel()
        setLanguageLabel()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpContinueLabel() {
        continueLabel.name = "continueLabel"
        continueLabel.fontSize = size.height * 0.045
        continueLabel.fontName = "BreeSerif-Regular"
        continueLabel.fontColor = SKColor(red: CGFloat(191.0 / 255.0), green: CGFloat(197.0 / 255.0), blue: CGFloat(217.0 / 255.0), alpha: 1.0)
        continueLabel.text = "Continuar"
        continueLabel.position = CGPoint(x: size.width * -0.1, y: size.height * 0.38)
        continueLabel.zPosition = 1.0
        
        addChild(continueLabel)
    }
    
    private func setUpOptionLabel() {
        optionLabel.name = "optionLabel"
        optionLabel.fontSize = size.height * 0.075
        optionLabel.fontName = "BigshotOne-Regular"
        optionLabel.fontColor = SKColor(red: CGFloat(0x17) / 255.0, green: CGFloat(0x18) / 255.0, blue: CGFloat(0x1C) / 255.0, alpha: 1.0)
        optionLabel.text = "Opções"
        optionLabel.position = CGPoint(x: size.width * 0, y: size.height * 0.18)
        optionLabel.zPosition = 1.0
        
        addChild(optionLabel)
    }
    
    private func setLanguageLabel() {
        languageLabel.name = "languageLabel"
        languageLabel.fontSize = size.height * 0.042
        languageLabel.fontName = "BreeSerif-Regular"
        languageLabel.fontColor = SKColor(red: CGFloat(0x17) / 255.0, green: CGFloat(0x18) / 255.0, blue: CGFloat(0x1C) / 255.0, alpha: 1.0)
        languageLabel.text = "Idioma"
        languageLabel.position = CGPoint(x: size.width * -0.17, y: size.height * 0.01)
        languageLabel.zPosition = 1.0
        
        addChild(languageLabel)
    }
}
