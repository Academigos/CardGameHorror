//
//  Erick.swift
//  CardGameHorror
//
//  Created by Eduardo on 28/07/23.
//

import Foundation
import SpriteKit

class Erick: SKSpriteNode{
    let erick: SKTexture
    
    init(){
        self.erick = SKTexture(imageNamed: "CreditosErick")
        super.init(texture: erick, color: .clear, size: erick.size())
        self.scale(to: autoScale(self, widthProportion: 0.22, screenSize: GameViewController.screenSize))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    @objc func handleTap(_ gestureRecognizer: UITapGestureRecognizer) {
        // Open the LinkedIn link when the sprite node is tapped
        if let url = URL(string: "https://www.linkedin.com/in/erickrib/") {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
}
