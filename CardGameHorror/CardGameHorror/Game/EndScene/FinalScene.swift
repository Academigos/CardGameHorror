//
//  FinalScene.swift
//  CardGameHorror
//
//  Created by Luiz Felipe on 26/07/23.
//

import SpriteKit

class FinalSceneVitoria : SKNode{
    let background = FinalBackground(finalBackground: "FinalSceneVitoria")
    let text = VitoriaText()
    let language = Languages(currentScene: "EndPlayer")
    let menu = MainMenuButtom()
    let creditos = Creditos(backScene: "EndPlayer")
    override init() {
        super.init()
      
        background.position = CGPoint(x: GameViewController.screenSize.width*0.5, y: GameViewController.screenSize.height*0.5)
        background.scale(to: GameViewController.screenSize)
        background.zPosition = -1
        addChild(background)
        
        text.position = CGPoint(x: GameViewController.screenSize.width * 0.76, y: GameViewController.screenSize.height * 0.61)
        addChild(text)
        
        language.scale(to: autoScale(language, widthProportion: 0.06, screenSize: GameViewController.screenSize))
        language.position = CGPoint(x: GameViewController.screenSize.width * 0.90, y: GameViewController.screenSize.height * 0.92)
        addChild(language)
        
        creditos.scale(to: autoScale(creditos, widthProportion: 0.21, screenSize: GameViewController.screenSize))
        creditos.position = CGPoint(x: GameViewController.screenSize.width * 0.76, y: GameViewController.screenSize.height * 0.3)
        addChild(creditos)
        
        menu.position = CGPoint(x: GameViewController.screenSize.width * 0.76, y: GameViewController.screenSize.height * 0.15)
        addChild(menu)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    

}
