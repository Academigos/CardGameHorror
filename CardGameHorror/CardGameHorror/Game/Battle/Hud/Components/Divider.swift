//
//  Divider.swift
//  CardGameHorror
//
//  Created by Eduardo on 23/07/23.
//

import Foundation
import SpriteKit

class Divader: SKSpriteNode{
    let divader : SKTexture
    
    init() {
        self.divader = SKTexture(imageNamed: "Divider")
        super.init(texture: self.divader, color: .clear, size: divader.size())
        self.scale(to: CGSize(width: GameViewController.screenSize.width * 1, height: GameViewController.screenSize.height * 0.30))
        isUserInteractionEnabled = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            if let touch = touches.first {
                let touchLocation = touch.location(in: self.scene!)
                let nodesAtPoint = self.scene?.nodes(at: touchLocation)

                // Verifica se há cartas abaixo do overlay e redireciona o toque para elas
                for node in nodesAtPoint ?? [] {
                    let canTouch = node.isUserInteractionEnabled
                    if canTouch == true{
                        if node is CardNode {
                            node.touchesBegan(touches, with: event)
                        }
                    }
                }
            }
        }
}
