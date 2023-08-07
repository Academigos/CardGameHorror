//
//  Fundo.swift
//  CardGameHorror
//
//  Created by Luiz Felipe on 20/07/23.
//

import SpriteKit

///Classe para definir o comportament do background da batalha
class Fundo:SKNode{
    let background = Background(background: "Background")
    let arvoresFundo = ArvoresFundo(arvoresFundo: "Arbustos")
    
    override init() {
        super.init()
        background.zPosition = 0
        arvoresFundo.zPosition=1

        background.position = CGPoint(x: 0, y: 0)
        arvoresFundo.position = CGPoint(x: 0, y: 0)
        
        addChild(background)
        addChild(arvoresFundo)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
