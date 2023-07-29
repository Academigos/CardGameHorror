//
//  YasminInsta.swift
//  CardGameHorror
//
//  Created by Eduardo on 28/07/23.
//

import Foundation
import SpriteKit

class YasminInsta: SKSpriteNode{
    let insta: SKTexture
    
    init() {
        self.insta = SKTexture(imageNamed: "Instagram")
        super.init(texture: insta, color: .clear, size: insta.size())
        self.scale(to: autoScale(self, widthProportion: 0.035, screenSize: GameViewController.screenSize))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    @objc func handleTap(_ gestureRecognizer: UITapGestureRecognizer) {
        // Open the LinkedIn link when the sprite node is tapped
        if let url = URL(string: "https://www.instagram.com/_yasminr_/") {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
}
