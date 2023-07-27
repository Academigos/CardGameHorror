//
//  Frente.swift
//  CardGameHorror
//
//  Created by Luiz Felipe on 20/07/23.
//

import SpriteKit

class Frente:SKNode {

    let estrada = Estrada(estrada: "Estrada")
    let arvoresFrentre = ArvoresFrente(arvoresFrente: "Arvores")
    override init() {
        super.init()  
        addChild(estrada)
        addChild(arvoresFrentre)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
