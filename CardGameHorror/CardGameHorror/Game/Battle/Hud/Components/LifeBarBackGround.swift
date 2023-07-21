//
//  LifeBarBackGround.swift
//  CardGameHorror
//
//  Created by Eduardo on 19/07/23.
//

import Foundation
import SpriteKit

class LifeBarBackGround: SKSpriteNode{
    let BackGroundTexture: SKTexture = SKTexture(imageNamed: "LifeBarBackGround")
    var hp = 0
    var totalHp = 3
    var valueLabel: SKLabelNode = SKLabelNode()
    init(life: Double, defaultLife: Double) {
        self.hp = Int(life)
        self.totalHp = Int(defaultLife)
        super.init(texture: BackGroundTexture, color: .clear, size: BackGroundTexture.size())
        setupValueLabel()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setupValueLabel() {
        valueLabel.name = "valueLabel"
        valueLabel.fontSize = 12
        valueLabel.fontName = "BreeSerif-Regular"
        valueLabel.fontColor = SKColor(red: 191/255.0, green: 197/255.0, blue: 217/255.0, alpha: 1.0)
        valueLabel.text = "\(hp)/\(totalHp)"
        valueLabel.zPosition = 2.0
        valueLabel.position = CGPoint(x: self.size.width * 0.5, y: self.size.height * 0.4)
        addChild(valueLabel)
    }
    
     func updateLifeBar(hp: Double) {
        valueLabel.text = "\(Int(hp))/\(totalHp)"
    }
}
