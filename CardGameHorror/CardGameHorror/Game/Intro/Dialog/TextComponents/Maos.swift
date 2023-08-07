//
//  Maos.swift
//  CardGameHorror
//
//  Created by Luiz Felipe on 24/07/23.
//

import SpriteKit

/// Classe para gerir o funcionamento da animação das mãos e posicionamento
class Maos : SKNode{
    let mao1 = Mao1(mao1: "handcartomante-1")
    let mao2 = Mao2(mao2: "handcartomante-2")
    
    override init() {
        super.init()
        zPosition = 1
        mao1.position = CGPoint(x: GameViewController.screenSize.width * 0.415, y: GameViewController.screenSize.height * 0.76)
        mao2.position = CGPoint(x: GameViewController.screenSize.width * 0.565, y: GameViewController.screenSize.height * 0.76)
        mao1.scale(to: autoScale(mao1, widthProportion: 0.138, screenSize: GameViewController.screenSize))
        mao2.scale(to: autoScale(mao2, widthProportion: 0.138, screenSize: GameViewController.screenSize))
        
        if GameController.shared.getDeviceModel() == "iPhone SE"{
            mao1.position = CGPoint(x: GameViewController.screenSize.width * 0.415, y: GameViewController.screenSize.height * 0.80)
            mao2.position = CGPoint(x: GameViewController.screenSize.width * 0.565, y: GameViewController.screenSize.height * 0.80)
        }
        
        
        addChild(mao1)
        addChild(mao2)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    ///Animação das mãos se abrindo
    func animacaoAbrindoMao(){
        var finalPosition1 = CGPoint(x: GameViewController.screenSize.width * 0.255, y: GameViewController.screenSize.height * 0.76)
        var finalPosition2 = CGPoint(x: GameViewController.screenSize.width * 0.735, y: GameViewController.screenSize.height * 0.76)
        
        if GameController.shared.getDeviceModel() == "iPhone SE"{
            finalPosition1 = CGPoint(x: GameViewController.screenSize.width * 0.255, y: GameViewController.screenSize.height * 0.80)
            finalPosition2 = CGPoint(x: GameViewController.screenSize.width * 0.735, y: GameViewController.screenSize.height * 0.80)
        }
        
        let moveLeftHandAction = SKAction.move(to: finalPosition1, duration: 0.6)
        let moveRightHandAction = SKAction.move(to: finalPosition2, duration: 0.6)
        
        mao1.run(moveLeftHandAction)
        mao2.run(moveRightHandAction){
            self.animacaoSubindoMao()
        }
    }
    
    ///Animação das mão subindo
    func animacaoSubindoMao(){
        let finalPosition1 = CGPoint(x: GameViewController.screenSize.width * 0.255, y: GameViewController.screenSize.height * 0.86)
        let finalPosition2 = CGPoint(x: GameViewController.screenSize.width * 0.735, y: GameViewController.screenSize.height * 0.86)
        
        let delay = SKAction.wait(forDuration: 0.1)
        let moveLeftHandAction = SKAction.move(to: finalPosition1, duration: 0.4)
        let moveRightHandAction = SKAction.move(to: finalPosition2, duration: 0.4)
        let sequenceMao1 = SKAction.sequence([delay, moveLeftHandAction])
        let sequenceMao2 = SKAction.sequence([delay, moveRightHandAction])

        mao1.run(sequenceMao1)
        mao2.run(sequenceMao2)
    }
    
}


