//
//  ResetBattle.swift
//  CardGameHorror
//
//  Created by Eduardo on 21/07/23.
//

import Foundation
import SpriteKit

protocol ResetBattleDelegate: AnyObject {
    func resetButtonTapped()
}

class ResetBattle: SKSpriteNode {
    let resetBattle: SKTexture
    weak var delegate: ClosePauseDelegate?

    weak var resetDelegate: ResetBattleDelegate?
  
    var resetBattleLabel: SKLabelNode = SKLabelNode()
  
    init() {
        self.resetBattle = SKTexture(imageNamed: "Button")
        super.init(texture: resetBattle, color: .clear, size: resetBattle.size())
        isUserInteractionEnabled = true
        setResetBattleLabel()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // Change the color when touched (for example, to red)
        self.texture = SKTexture(imageNamed: "PressedButtom")
        
        // Add a slight delay (e.g., 0.1 seconds) to revert the color back to clear
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            self.texture = self.resetBattle
        }
        
        // Call the startNewGame() function from the GameController
        GameController.shared.startNewGame()
        delegate?.closePauseButtonTapped()
        resetDelegate?.resetButtonTapped()
    }
    
    private func setResetBattleLabel() {
        resetBattleLabel.name = "resetBattleLabel"
        resetBattleLabel.fontSize = size.height * 0.32
        resetBattleLabel.fontName = "BreeSerif-Regular"
        resetBattleLabel.fontColor = SKColor(red: CGFloat(0x17) / 255.0, green: CGFloat(0x18) / 255.0, blue: CGFloat(0x1C) / 255.0, alpha: 1.0)
        resetBattleLabel.text = LanguageManager.shared.localizedString("Recomeçar Batalha")
        resetBattleLabel.position = CGPoint(x: size.width * 0, y: size.height * -0.1)
        resetBattleLabel.zPosition = 1.0
        
        addChild(resetBattleLabel)
    }
}
