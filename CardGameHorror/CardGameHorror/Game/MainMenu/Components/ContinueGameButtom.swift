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

///Classe para o botão de continue no menu princial
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
    
    //função para definir a opacidade
    private func opacity(){
        if GameController.isCutScenePassed == true {
            self.alpha = 1.0
            self.isUserInteractionEnabled = true
        } else {
            self.alpha = 0.8
            self.isUserInteractionEnabled = false
        }
    }
    
    //formatar o texto
    private func setupContinueLabel() {
        continueLabel.name = "ContinueLabel"
        continueLabel.fontName = "BreeSerif-Regular"
        continueLabel.fontColor = SKColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1.0)
        continueLabel.text = LanguageManager.shared.localizedString("Continuar")
        
        if GameController.shared.getDeviceModel() == "iPhone SE" || GameController.shared.getDeviceModel() == "iPhone 8" {
            continueLabel.fontSize = size.height * 0.14
            continueLabel.position = CGPoint(x: self.size.width * 0.15, y: self.size.height * -0.55)
        }else if GameController.shared.getDeviceModel() == "iPhone X" {
            continueLabel.fontSize = size.height * 0.12
            continueLabel.position = CGPoint(x: self.size.width * 0.1, y: self.size.height * -0.45)
        }else if GameController.shared.getDeviceModel() == "iPhone 11" || GameController.shared.getDeviceModel() == "iPhone 12" {
            continueLabel.fontSize = size.height * 0.12
            continueLabel.position = CGPoint(x: self.size.width * 0.1, y: self.size.height * -0.43)
        }else if GameController.shared.getDeviceModel() == "iPhone 14 Pro" {
            continueLabel.fontSize = size.height * 0.10
            continueLabel.position = CGPoint(x: self.size.width * 0.1, y: self.size.height * -0.4)
        }else {
            continueLabel.fontSize = size.height * 0.12
            continueLabel.position = CGPoint(x: self.size.width * 0.1, y: self.size.height * -0.4)
        }
        
        continueLabel.zPosition = 1.0
        addChild(continueLabel)
    }
}
