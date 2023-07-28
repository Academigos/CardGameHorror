//
//  Maos.swift
//  CardGameHorror
//
//  Created by Luiz Felipe on 24/07/23.
//

import SpriteKit

class Maos : SKNode{
    let mao1 = Mao1(mao1: "handCartomante-1")
    let mao2 = Mao2(mao2: "handCartomante-2")
    
    override init() {
        super.init()
        zPosition = 1
        mao1.position = CGPoint(x: 321, y: 290)
        mao2.position = CGPoint(x: 518, y: 290)
        mao1.scale(to: autoScale(mao1, widthProportion: 0.15, screenSize: GameViewController.screenSize))
        mao2.scale(to: autoScale(mao2, widthProportion: 0.15, screenSize: GameViewController.screenSize))
        addChild(mao1)
        addChild(mao2)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func animacaoAbrindoMao(){
        let finalPosition1 = CGPoint(x: 200, y: 290)
        let finalPosition2 = CGPoint(x: 638, y: 290)
        
        let moveLeftHandAction = SKAction.move(to: finalPosition1, duration: 0.6)
        let moveRightHandAction = SKAction.move(to: finalPosition2, duration: 0.6)
        
        mao1.run(moveLeftHandAction)
        mao2.run(moveRightHandAction){self.animacaoSubindoMao()}
    }
    
    func animacaoSubindoMao(){
        let finalPosition1 = CGPoint(x: 200, y: 340)
        let finalPosition2 = CGPoint(x: 638, y: 340)
        
        let moveLeftHandAction = SKAction.move(to: finalPosition1, duration: 0.3)
        let moveRightHandAction = SKAction.move(to: finalPosition2, duration: 0.3)

        mao1.run(moveLeftHandAction)
        mao2.run(moveRightHandAction)
    }
    
}


