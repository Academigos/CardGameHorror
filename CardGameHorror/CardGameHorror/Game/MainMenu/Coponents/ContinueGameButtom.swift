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
    let isCutScenePassed: Bool
    
    weak var delegate: ContinueGameButtomDelegate?

    
    init(isCutScenePassed: Bool) {
        self.continueGameButtom = SKTexture(imageNamed: "Buttom")
        self.isCutScenePassed = isCutScenePassed
        super.init(texture: continueGameButtom, color: .clear, size: continueGameButtom.size())
        self.scale(to: autoScale(self, widthProportion: 0.4, screenSize: GameViewController.screenSize))
        opacity()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            delegate?.continueGameButtonTapped()
    }
    
    private func opacity(){
        if isCutScenePassed {
            self.alpha = 1.0 // Full opacity (visible and touchable)
            self.isUserInteractionEnabled = true // Enable touch interaction
        } else {
            self.alpha = 0.5 // Half opacity (partially transparent)
            self.isUserInteractionEnabled = false // Disable touch interaction
        }
    }
}
