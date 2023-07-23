//
//  Camera.swift
//  CardGameHorror
//
//  Created by Eduardo on 23/07/23.
//

import Foundation
import SpriteKit

class Camera: SKSpriteNode {
    let camera: SKTexture
    
    init(){
        camera = SKTexture(imageNamed: "Camera")
        super.init(texture: camera, color: .clear, size: camera.size())
        self.scale(to: autoScale(self, widthProportion: 0.95, screenSize: GameViewController.screenSize))
        isUserInteractionEnabled = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
