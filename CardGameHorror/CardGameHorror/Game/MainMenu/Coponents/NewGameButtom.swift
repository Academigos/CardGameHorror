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
}

class NewGameButtom: SKSpriteNode{
    let buttomNewGame: SKTexture
    weak var delegate: NewGameButtomDelegate?

    init() {
        self.buttomNewGame = SKTexture(imageNamed: "Buttom")
        super.init(texture: buttomNewGame, color: .clear, size: buttomNewGame.size())
        self.scale(to: autoScale(self, widthProportion: 0.4, screenSize: GameViewController.screenSize))
        isUserInteractionEnabled = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        GameController.shared.startNewGame()
        delegate?.newGameButtonTapped()
    }
}
