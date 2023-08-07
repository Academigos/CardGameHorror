//
//  Musicas.swift
//  CardGameHorror
//
//  Created by Eduardo on 28/07/23.
//

import Foundation
import SpriteKit

///Classe para manipular o crédito para as músicas
class Musicas: SKSpriteNode{
    let musicas: SKTexture
    
    init(){
        self.musicas = SKTexture(imageNamed: "CreditosMusicas")
        super.init(texture: musicas, color: .clear, size: musicas.size())
        self.scale(to: autoScale(self, widthProportion: 0.23, screenSize: GameViewController.screenSize))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
