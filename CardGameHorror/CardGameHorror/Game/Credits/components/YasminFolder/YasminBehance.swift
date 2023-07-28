//
//  YasminBehance.swift
//  CardGameHorror
//
//  Created by Eduardo on 28/07/23.
//

import Foundation
import SpriteKit


class YasminBe: SKSpriteNode{
    let behance: SKTexture
    
    init() {
        self.behance = SKTexture(imageNamed: "Behance")
        super.init(texture: behance, color: .clear, size: behance.size())
        self.scale(to: autoScale(self, widthProportion: 0.035, screenSize: GameViewController.screenSize))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    @objc func handleTap(_ gestureRecognizer: UITapGestureRecognizer) {
        // Open the LinkedIn link when the sprite node is tapped
        if let url = URL(string: "https://www.behance.net/yasminsrodrigues") {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
}
