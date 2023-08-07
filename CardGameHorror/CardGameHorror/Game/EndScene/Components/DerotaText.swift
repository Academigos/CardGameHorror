//
//  DerotaText.swift
//  CardGameHorror
//
//  Created by Eduardo on 28/07/23.
//

import Foundation
import SpriteKit

///Classe para definir o texto de derrota para inglês ou português
class DerotaText: SKSpriteNode{
    let text: SKTexture
    
    init() {
        if LanguageManager.shared.currentLanguage == "pt-BR"{
            text = SKTexture(imageNamed: "TextoDerrotaPT")
        }else{
            text = SKTexture(imageNamed: "TextoDerrotaEN")
        }
        super.init(texture: self.text, color: .clear, size: self.text.size())
        self.scale(to: autoScale(self, widthProportion: 0.30, screenSize: GameViewController.screenSize))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
