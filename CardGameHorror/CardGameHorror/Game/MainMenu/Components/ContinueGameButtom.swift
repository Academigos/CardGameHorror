//
//  ContinueGameButtom.swift
//  CardGameHorror
//
//  Created by Eduardo on 23/07/23.
//

import Foundation
import SpriteKit

protocol ContinueGameButtomDelegate: AnyObject {
    func continueGameButtonTapped()
}

class ContinueGameButtom: SKSpriteNode{
    let continueGameButtom: SKTexture
    var continueLabel: SKLabelNode = SKLabelNode()
    
    weak var delegate: ContinueGameButtomDelegate?

    
    init() {
        self.continueGameButtom = SKTexture(imageNamed: "Continue")
        super.init(texture: self.continueGameButtom, color: .clear, size: self.continueGameButtom.size())
        self.scale(to: autoScale(self, widthProportion: 0.17, screenSize: GameViewController.screenSize))
        setupContinueLabel()
        opacity()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            delegate?.continueGameButtonTapped()
    }
    
    private func opacity(){
        if GameController.shared.isCutScenePassed {
            self.alpha = 1.0 // Full opacity (visible and touchable)
            self.isUserInteractionEnabled = true // Enable touch interaction
        } else {
            self.alpha = 0.8 // Half opacity (partially transparent)
            self.isUserInteractionEnabled = false // Disable touch interaction
        }
    }
    private func setupContinueLabel() {
        continueLabel.name = "ContinueLabel"
        continueLabel.fontSize = size.height * 0.12
        continueLabel.fontName = "BreeSerif-Regular"
        continueLabel.fontColor = SKColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1.0)
        continueLabel.text = LanguageManager.shared.localizedString("Continuar")
        continueLabel.position = CGPoint(x: size.width * 0.11, y: size.height * -0.43)
        continueLabel.zPosition = 1.0
        addChild(continueLabel)
    }
}
