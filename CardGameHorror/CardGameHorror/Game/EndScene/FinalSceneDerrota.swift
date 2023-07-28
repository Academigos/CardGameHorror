//
//  FinalSceneDerrota.swift
//  CardGameHorror
//
//  Created by Luiz Felipe on 27/07/23.
//

import SpriteKit

class FinalSceneDerrota : SKNode{
    let background = FinalBackground(finalBackground: "FinalSceneDerrota")
    let dialogbox = DialogBox(dialogBox: "DialogFinalDerrota")
    let dialogo = dialogoFinal[0].texto
    override init() {
        super.init()
        background.position = CGPoint(x: GameViewController.screenSize.width*0.5, y: GameViewController.screenSize.height*0.5)
        background.zPosition = -1
        dialogbox.position = CGPoint(x: GameViewController.screenSize.width*0.75, y: GameViewController.screenSize.height*0.6)
        background.scale(to: autoScale(background, widthProportion: 1, screenSize: GameViewController.screenSize))
        dialogbox.scale(to: autoScale(dialogbox, widthProportion: 0.6, screenSize: GameViewController.screenSize))
        dialogbox.zPosition = 0
        
        addChild(background)
        addChild(dialogbox)
        dialogbox.addTextContent(textContent: dialogo, cor: .white)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    

}
