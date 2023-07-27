//
//  ClosePause.swift
//  CardGameHorror
//
//  Created by Eduardo on 21/07/23.
//

import Foundation
import SpriteKit

protocol ClosePauseDelegate: AnyObject {
    func closePauseButtonTapped()
}

class ClosePause: SKSpriteNode {
    weak var delegate: ClosePauseDelegate?
    let ClosePause: SKTexture
    
    init() {
        self.ClosePause = SKTexture(imageNamed: "ClosePause")
        super.init(texture: ClosePause, color: .clear, size: ClosePause.size())
        isUserInteractionEnabled = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        delegate?.closePauseButtonTapped()
    }
}
