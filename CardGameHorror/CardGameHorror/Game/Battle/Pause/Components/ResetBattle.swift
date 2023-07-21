//
//  ResetBattle.swift
//  CardGameHorror
//
//  Created by Eduardo on 21/07/23.
//

import Foundation
import SpriteKit

class ResetBattle: SKSpriteNode{
    let resetBattle: SKTexture
    init() {
        self.resetBattle = SKTexture(imageNamed: "ResetBattle")
        super.init(texture: resetBattle, color: .clear, size: resetBattle.size())
        isUserInteractionEnabled = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // Change the color when touched (for example, to red)
        self.texture = SKTexture(imageNamed: "PressedResetBattle")
        
        // Add a slight delay (e.g., 0.1 seconds) to revert the color back to clear
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            self.texture = self.resetBattle
        }
        
        // Call the startNewGame() function from the GameController
        GameController.shared.startNewGame()
    }
}
