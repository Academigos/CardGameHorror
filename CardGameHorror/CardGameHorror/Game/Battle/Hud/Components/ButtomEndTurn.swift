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
    var cardsSelectLabel: SKLabelNode = SKLabelNode()
    var finishTurnLabel: SKLabelNode = SKLabelNode()
    var stackPopUp:FloatingNode?
    
    var counter = 0
    let totalCount = 3
    let buttomTexture: SKTexture
    
    init() {
        self.buttomTexture = SKTexture(imageNamed: "EndTurn")
        super.init(texture: self.buttomTexture, color: .clear, size: self.buttomTexture.size())
        GameController.shared.addObserver(self, forKeyPath: #keyPath(GameController.selectedCard),options: [.new], context: nil)
        setupCardsSelectLabel()
        setupFinishTurnLabel()
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
        if GameController.shared.selectedCard.count == 3{
            let selectedCards = Set(GameController.shared.selectedCard)
            GameController.shared.processSelectedCards(selectedCards: selectedCards)
            GameController.shared.playerTurn()
            // Verifica se há pelo menos uma carta no array com type igual a "DEF"
            if let hud = parent as? Hud {
                hud.updateLife()
            }
            endTurnButtonDelegate?.handCardsDidFinishAnimating()
            stackPopUp?.checkStackSelectedCards(position: self.position)    
            // change the scene in case of player or monster die
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                if DataManager.shared.fetchPlayer().hp <= 0{
                    if let currentScene = self.scene {
                        let transition = SKTransition.fade(withDuration: 1)
                        let mainMenuScene = MonsterEnd(size: currentScene.size) // Assuming MainMenuScene is the class for the scene you want to transition to.
                        currentScene.view?.presentScene(mainMenuScene, transition: transition)
                        // Call the startNewGame() function from the GameController
                    }
                }else if DataManager.shared.fetchMonster().hp <= 0{
                    if let currentScene = self.scene {
                        let transition = SKTransition.fade(withDuration: 1)
                        let mainMenuScene = PlayerEnd(size: currentScene.size) // Assuming MainMenuScene is the class for the scene you want to transition to.
                        currentScene.view?.presentScene(mainMenuScene, transition: transition)
                        // Call the startNewGame() function from the GameController
                    }
                }
            }
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
    
    private func setupCardsSelectLabel() {
        cardsSelectLabel.name = "cardsSelectLabel"
        cardsSelectLabel.fontSize = size.height * 0.16
        cardsSelectLabel.fontName = "BreeSerif-Regular"
        cardsSelectLabel.fontColor = SKColor(red: 129/255, green: 134/255, blue: 150/255, alpha: 1.0)
        cardsSelectLabel.text = "\(counter)/\(totalCount) Cartas"
        cardsSelectLabel.position = CGPoint(x: size.width * 0, y: size.height * 0.3)
        cardsSelectLabel.zPosition = 1.0
        
        addChild(cardsSelectLabel)
    }
    
    private func setupFinishTurnLabel() {
        
        let text = "Finalizar turno"
        let fontSize = size.height * 0.18 // Definindo o tamanho da fonte com base na altura da tela
        
        let font = UIFont(name: "BreeSerif-Regular", size: fontSize)
        
        if let customFont = font {
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.alignment = .center
            let attrString = NSMutableAttributedString(string: text, attributes: [
                .font: customFont,
                .foregroundColor: UIColor(red: CGFloat(0x17) / 255.0, green: CGFloat(0x18) / 255.0, blue: CGFloat(0x1C) / 255.0, alpha: 1.0),
                .paragraphStyle: paragraphStyle
            ])
            
            finishTurnLabel.attributedText = attrString
        } else {
            finishTurnLabel.text = "Finalizar turno"
        }
        
        finishTurnLabel.name = "finishTurnLabel"
        finishTurnLabel.fontSize = size.height * 0.16
        finishTurnLabel.fontName = "BreeSerif-Regular"
        finishTurnLabel.numberOfLines = 0
        finishTurnLabel.lineBreakMode = .byWordWrapping
        finishTurnLabel.preferredMaxLayoutWidth = size.width * 0.55 // Define a largura máxima para quebrar o
        finishTurnLabel.horizontalAlignmentMode = .center
        finishTurnLabel.position = CGPoint(x: 0, y: size.height * -0.35)
        finishTurnLabel.zPosition = 1.0
        
        addChild(finishTurnLabel)
    }
    
    func updateValueCartas(){
        counter = GameController.shared.selectedCard.count
        cardsSelectLabel.text = "\(counter)/\(totalCount) Cartas"
    }
    
    deinit {
        // Remove the observer when the instance is deallocated
        GameController.shared.removeObserver(self, forKeyPath: #keyPath(GameController.selectedCard))
    }
}
