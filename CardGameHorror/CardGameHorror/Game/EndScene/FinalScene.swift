//
//  FinalScene.swift
//  CardGameHorror
//
//  Created by Luiz Felipe on 26/07/23.
//

import SpriteKit

class FinalSceneVitoria : SKNode{
    let background = FinalBackground(finalBackground: "FinalSceneVitoria")
    let dialogbox = DialogBox(dialogBox: "DialogFinalVitoria")
    let dialogo = dialogoFinal[1].texto
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
        dialogbox.addTextContent(textContent: dialogo, cor: .black)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    

}
