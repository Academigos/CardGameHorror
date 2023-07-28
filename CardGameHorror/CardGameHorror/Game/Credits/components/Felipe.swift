//
//  Felipe.swift
//  CardGameHorror
//
//  Created by Eduardo on 28/07/23.
//

import Foundation
import SpriteKit

class Felipe: SKSpriteNode{
    let felipe: SKTexture
    
    init(){
        self.felipe = SKTexture(imageNamed: "CreditosFelipe")
        super.init(texture: felipe, color: .clear, size: felipe.size())
        self.scale(to: autoScale(self, widthProportion: 0.22, screenSize: GameViewController.screenSize))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    @objc func handleTap(_ gestureRecognizer: UITapGestureRecognizer) {
        // Open the LinkedIn link when the sprite node is tapped
        if let url = URL(string: "https://www.instagram.com/fe.lipe_z/") {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
}
