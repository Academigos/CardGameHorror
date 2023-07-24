//
//  DialogView.swift
//  CardGameHorror
//
//  Created by Giovanni Favorin de Melo on 23/07/23.
//

import SpriteKit

class DialogView: SKNode {
    let scenary = IntroScenary(backgroundType: .desk)
    let caixaTexto = TextBox(dialogo: dialogo[3])
    
    override init() {
        super.init()
        
        addChild(scenary)
        addChild(caixaTexto)
        //startDialog()
    }
    
//    func startDialog() {
//            let textBox = TextBox(textBoxType: .cartomante)
//            // Adicione a caixa de diálogo à sua cena
//            self.addChild(textBox)
//
//            // Iniciar o diálogo
//            textBox.playDialog()
//    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
