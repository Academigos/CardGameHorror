//
//  NewGameButtom.swift
//  CardGameHorror
//
//  Created by Eduardo on 23/07/23.
//

import Foundation
import SpriteKit

protocol NewGameButtomDelegate: AnyObject {
    func newGameButtonTapped()
    func openDiaryOne()
}

class NewGameButtom: SKSpriteNode{
    let buttomNewGame: SKTexture
    var startLabel: SKLabelNode = SKLabelNode()

    weak var delegate: NewGameButtomDelegate?
    
    var isButtonInteractionEnabled = true

    init() {
        self.buttomNewGame = SKTexture(imageNamed: "Start")
        super.init(texture: buttomNewGame, color: .clear, size: buttomNewGame.size())
        setupStartLabel()
        self.scale(to: autoScale(self, widthProportion: 0.33, screenSize: GameViewController.screenSize))
        isUserInteractionEnabled = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        GameController.shared.startNewGame()
//        delegate?.newGameButtonTapped()
        guard isButtonInteractionEnabled else {
            return
        }
        
        isButtonInteractionEnabled = false
        delegate?.openDiaryOne()
        GameController.isCutScenePassed = false
    }
    
    private func setupStartLabel() {
        startLabel.name = "ContinueLabel"
        startLabel.fontSize = size.height * 0.12
        startLabel.fontName = "BreeSerif-Regular"
        startLabel.fontColor = SKColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1.0)
        startLabel.text = LanguageManager.shared.localizedString("Começar")
        startLabel.position = CGPoint(x: size.width * 0, y: size.height * 0.35)
        startLabel.zPosition = 1.0
        addChild(startLabel)
    }
}
