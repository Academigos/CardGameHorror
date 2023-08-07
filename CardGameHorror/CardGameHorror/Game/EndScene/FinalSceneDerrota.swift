//
//  FinalSceneDerrota.swift
//  CardGameHorror
//
//  Created by Luiz Felipe on 27/07/23.
//

import SpriteKit

//Classe para reunir todos os componentes e posicioná-los
class FinalSceneDerrota : SKNode{
    let background = FinalBackground(finalBackground: "FinalSceneDerrota")
    let text = DerotaText()
    let tentaBatle = ResetButtom()
    let language = Languages(currentScene: "EndMonster")
    let menu = MainMenuButtom()
    let finalDialogBox = FinalDialog(finalDialog: "DialogFinalDerrota")

    override init() {
        super.init()
        
        background.position = CGPoint(x: GameViewController.screenSize.width * 0.5, y: GameViewController.screenSize.height * 0.5)
        background.scale(to: GameViewController.screenSize)
        background.zPosition = -1
        addChild(background)
        
        finalDialogBox.position = CGPoint(x: GameViewController.screenSize.width * 0.76, y: GameViewController.screenSize.height * 0.61)
        //finalDialogBox.scale(to: GameViewController.screenSize)
        finalDialogBox.zPosition = 0
        addChild(finalDialogBox)
        
        text.position = CGPoint(x: GameViewController.screenSize.width * 0.76, y: GameViewController.screenSize.height * 0.61)
        addChild(text)
        text.zPosition=1
        
        language.scale(to: autoScale(language, widthProportion: 0.06, screenSize: GameViewController.screenSize))
        language.position = CGPoint(x: GameViewController.screenSize.width * 0.90, y: GameViewController.screenSize.height * 0.92)
        addChild(language)
        
        menu.position = CGPoint(x: GameViewController.screenSize.width * 0.76, y: GameViewController.screenSize.height * 0.15)
        addChild(menu)
        
        tentaBatle.position = CGPoint(x: GameViewController.screenSize.width * 0.76, y: GameViewController.screenSize.height * 0.3)
        addChild(tentaBatle)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
