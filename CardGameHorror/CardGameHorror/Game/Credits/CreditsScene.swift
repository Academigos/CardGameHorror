//
//  CreditsScene.swift
//  CardGameHorror
//
//  Created by Eduardo on 28/07/23.
//

import Foundation
import SpriteKit

///Classe que define a cena de créditos
class CreditsScene: SKScene{
    let background = CreditsBackground()
    let firstDivader = CreditsDivider()
    let secondDivader = CreditsDivider()
    let language = Languages(currentScene: "CreditsScene")
    let yasmin = Yasmin()
    let eduardo = Eduardo()
    let erick = Erick()
    let giovanni = Giovanni()
    let felipe = Felipe()
    let musicas = Musicas()
    let title: SKLabelNode = SKLabelNode()
    let design: SKLabelNode = SKLabelNode()
    let programming: SKLabelNode = SKLabelNode()
    let musica: SKLabelNode = SKLabelNode()
    var back:CreditBack
    
    init(backScene: String, size: CGSize) {
        self.back = CreditBack(currentScene: backScene)
        super.init(size: size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //Função responsável por coordenar e posicionar cada elemento na tela
    override func didMove(to view: SKView) {
        back.position = CGPoint(x: GameViewController.screenSize.width * 0.09, y: GameViewController.screenSize.height * 0.92)
        back.zPosition = 20
        addChild(back)
        
        eduardo.position = CGPoint(x: GameViewController.screenSize.width * 0.71, y: GameViewController.screenSize.height * 0.62)
        eduardo.zPosition = 20
        addChild(eduardo)
        
        erick.position = CGPoint(x: GameViewController.screenSize.width * 0.71, y: GameViewController.screenSize.height * 0.5)
        erick.zPosition = 20
        addChild(erick)
        
        giovanni.position = CGPoint(x: GameViewController.screenSize.width * 0.71, y: GameViewController.screenSize.height * 0.38)
        giovanni.zPosition = 20
        addChild(giovanni)
        
        felipe.position = CGPoint(x: GameViewController.screenSize.width * 0.71, y: GameViewController.screenSize.height * 0.26)
        felipe.zPosition = 20
        addChild(felipe)
        
        yasmin.zPosition = 20
        addChild(yasmin)
        
        musicas.position = CGPoint(x: GameViewController.screenSize.width * 0.28, y: GameViewController.screenSize.height * 0.26)
        musicas.zPosition = 20
        addChild(musicas)
        
        title.text = LanguageManager.shared.localizedString("Créditos")
        title.fontName = "BreeSerif-Regular"
        title.fontSize = GameViewController.screenSize.width * 0.04
        title.position = CGPoint(x: GameViewController.screenSize.width * 0.5, y: GameViewController.screenSize.height * 0.87)
        title.fontColor = SKColor(red: CGFloat(65.0 / 255.0), green: CGFloat(84.0 / 255.0), blue: CGFloat(128.0 / 255.0), alpha: 1.0)
        title.zPosition = 10
        addChild(title)
        
        design.text = LanguageManager.shared.localizedString("Arte e Design")
        design.fontName = "BreeSerif-Regular"
        design.fontSize = GameViewController.screenSize.width * 0.035
        design.position = CGPoint(x: GameViewController.screenSize.width * 0.27, y: GameViewController.screenSize.height * 0.72)
        design.fontColor = SKColor(red: CGFloat(65.0 / 255.0), green: CGFloat(84.0 / 255.0), blue: CGFloat(128.0 / 255.0), alpha: 1.0)
        design.zPosition = 10
        addChild(design)
        
        programming.text = LanguageManager.shared.localizedString("Programação")
        programming.fontName = "BreeSerif-Regular"
        programming.fontSize = GameViewController.screenSize.width * 0.035
        programming.position = CGPoint(x: GameViewController.screenSize.width * 0.70, y: GameViewController.screenSize.height * 0.72)
        programming.fontColor = SKColor(red: CGFloat(65.0 / 255.0), green: CGFloat(84.0 / 255.0), blue: CGFloat(128.0 / 255.0), alpha: 1.0)
        programming.zPosition = 10
        addChild(programming)
        
        musica.text = LanguageManager.shared.localizedString("Música")
        musica.fontName = "BreeSerif-Regular"
        musica.fontSize = GameViewController.screenSize.width * 0.035
        musica.position = CGPoint(x: GameViewController.screenSize.width * 0.22, y: GameViewController.screenSize.height * 0.45)
        musica.fontColor = SKColor(red: CGFloat(65.0 / 255.0), green: CGFloat(84.0 / 255.0), blue: CGFloat(128.0 / 255.0), alpha: 1.0)
        musica.zPosition = 10
        addChild(musica)
        
        language.position = CGPoint(x: GameViewController.screenSize.width * 0.9, y: GameViewController.screenSize.height * 0.92)
        language.zPosition = 101
        addChild(language)
        
        firstDivader.position = CGPoint(x: GameViewController.screenSize.width * 0.27, y: GameViewController.screenSize.height * 0.9)
        secondDivader.position = CGPoint(x: GameViewController.screenSize.width * 0.72, y: GameViewController.screenSize.height * 0.9)
        firstDivader.zPosition = 100
        secondDivader.zPosition = 100
        
        addChild(firstDivader)
        addChild(secondDivader)
        
        background.position = CGPoint(x: GameViewController.screenSize.width * 0.5, y: GameViewController.screenSize.height * 0.5)
        addChild(background)
    }
}
