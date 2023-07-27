//
//  OverlayDiary.swift
//  CardGameHorror
//
//  Created by Erick Ribeiro on 26/07/23.
//

import SpriteKit

protocol closeOverlay : AnyObject {
    func closeOverlay()
}

class OverlayDiary: SKSpriteNode{
    
    weak var delegate: closeOverlay?
    var isButtonInteractionEnabled = true
    
    init() {
        super.init(texture: nil, color: .black, size: GameViewController.screenSize)
        position = CGPoint(x: GameViewController.screenSize.width / 2, y: GameViewController.screenSize.height / 2)
        alpha = 0.0
        zPosition = 99
        name = "overlayDiary"
        isUserInteractionEnabled = true
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard isButtonInteractionEnabled else {
            return
        }
        
        isButtonInteractionEnabled = false
        
        delegate?.closeOverlay()
    }
    
    func animationEntryOverlay(){
        let easeInActionDelay = SKAction.sequence([
            SKAction.fadeAlpha(to:  0, duration: 0),
            SKAction.fadeAlpha(to: 0.7, duration: 0.6)
        ])
        run(easeInActionDelay)
        run(SKAction.sequence([SKAction.wait(forDuration: 2.0)]))
    }
    
    func animationExitOverlay(){
        let easeInActionDelay = SKAction.sequence([
            SKAction.fadeAlpha(to:  0.7, duration: 0),
            SKAction.fadeAlpha(to: 0, duration: 0.6)
        ])
        run(easeInActionDelay)
        run(SKAction.sequence([SKAction.wait(forDuration: 2.0)]))
    }
}
