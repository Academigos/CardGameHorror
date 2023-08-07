//
//  Camera.swift
//  CardGameHorror
//
//  Created by Eduardo on 23/07/23.
//

import Foundation
import SpriteKit

///Classe para controlar o efeito de câmera 
class Camera: SKSpriteNode {
    let camera: SKTexture
    
    init(){
        camera = SKTexture(imageNamed: "Camera")
        super.init(texture: camera, color: .clear, size: camera.size())
        self.scale(to: CGSize(width: GameViewController.screenSize.width * 0.92, height: GameViewController.screenSize.height * 0.92))
        isUserInteractionEnabled = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
