//
//  buttomSprite.swift
//  CardGameHorror
//
//  Created by Eduardo on 19/07/23.
//

import Foundation
import SpriteKit
class ButtonEndTurn: SKSpriteNode{
    
    weak var endTurnButtonDelegate: endTurnDelegate?
    var valueLabel: SKLabelNode = SKLabelNode()
    
    var counter = 0
    let totalCount = 3
    let buttomTexture: SKTexture
    
    init(buttomTexture: String) {
        self.buttomTexture = SKTexture(imageNamed: buttomTexture)
        super.init(texture: self.buttomTexture, color: .clear, size: self.buttomTexture.size())
        GameController.shared.addObserver(self, forKeyPath: #keyPath(GameController.selectedCard),options: [.new], context: nil)
        setupValueLabel()
        isUserInteractionEnabled = true
        if GameController.shared.selectedCard.count < 3 {
            alpha = 0.5
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == #keyPath(GameController.selectedCard) {
            // The observed property has changed, update the opacity
            updateOpacity()
            updateValueCartas()
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if GameController.shared.isGameOver() == false && GameController.shared.selectedCard.count == 3{
            let selectedCards = Set(GameController.shared.selectedCard)
            GameController.shared.processSelectedCards(selectedCards: selectedCards)
            GameController.shared.playerTurn()
            GameController.shared.monsterTurn()
            endTurnButtonDelegate?.handCardsDidFinishAnimating()
            if let hud = parent as? Hud {
                hud.updateLife(DataManager.shared.fetchPlayer().hp, DataManager.shared.fetchMonster().hp)
            }
        }else if GameController.shared.isGameOver() == true{
            print("bla")
        }else{
            let impactFeedbackGenerator = UIImpactFeedbackGenerator(style: .heavy)
            impactFeedbackGenerator.prepare()
            impactFeedbackGenerator.impactOccurred()
        }
    }
    
    func updateOpacity() {
        if GameController.shared.selectedCard.count < 3 {
            alpha = 0.5
        } else {
            alpha = 1.0
        }
    }
    
    private func setupValueLabel() {
        valueLabel.name = "valueLabel"
        valueLabel.fontSize = 12
        valueLabel.fontName = "BigshotOne-Regular"
        valueLabel.fontColor = .white
        valueLabel.text = "\(counter)/\(totalCount) Cartas"
        valueLabel.position = CGPoint(x: size.width * -0.2, y: size.height * 0.3)
       // valueLabel.zPosition = 1.0
        
        addChild(valueLabel)
    }
    
    func updateValueCartas(){
        counter = GameController.shared.selectedCard.count
        valueLabel.text = "\(counter)/\(totalCount) Cartas"
    }
    
    deinit {
        // Remove the observer when the instance is deallocated
        GameController.shared.removeObserver(self, forKeyPath: #keyPath(GameController.selectedCard))
    }
}
