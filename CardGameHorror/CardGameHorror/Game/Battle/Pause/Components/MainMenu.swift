//
//  MainMenu.swift
//  CardGameHorror
//
//  Created by Eduardo on 21/07/23.
//

import Foundation
import SpriteKit

class MainMenu: SKSpriteNode{
     let mainMenu: SKTexture
    weak var delegate: ClosePauseDelegate?

    init() {
        self.mainMenu = SKTexture(imageNamed: "Buttom")
        super.init(texture: mainMenu, color: .clear, size: mainMenu.size())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // Change the color when touched (for example, to red)
        self.texture = SKTexture(imageNamed: "PressedButtom")
        
        // Add a slight delay (e.g., 0.1 seconds) to revert the color back to clear
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            self.texture = self.mainMenu
        }
        
        // Call the startNewGame() function from the GameController
        delegate?.closePauseButtonTapped()

    }
}
