//
//  MainPauseButtom.swift
//  CardGameHorror
//
//  Created by Eduardo on 25/07/23.
//

import Foundation
import SpriteKit

class MainPauseButtom: SKSpriteNode, ClosePauseDelegate{
    let pauseButtom: SKTexture
    let pauseBackground = MainPauseBackground()
    let closePause = ClosePause()
    let overlayPause = OverlayPause()
    let languages: Languages
    let mainMenu = MainMenu()
    let credits = Creditos()
    var isAnimating = false
    var isIntro: Bool
    
    init(isIntro: Bool , currentScene: String) {
        self.isIntro = isIntro
        languages = Languages(currentScene: currentScene)
        self.pauseButtom = SKTexture(imageNamed: "PauseButtom")
        super.init(texture: pauseButtom, color: .clear, size: pauseButtom.size())
        isUserInteractionEnabled = true
        closePause.delegate = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if !isAnimating, let scene = self.scene {
            isAnimating = true
            if scene.isPaused == false {
                // Executar a animação "Pop In" para mostrar o menu de pausa
                let easeInAction = SKAction.sequence([
                    SKAction.fadeAlpha(to: 0, duration: 0), // Começa totalmente transparente
                    SKAction.fadeAlpha(to: 1, duration: 0.6) // Fade-in com aceleração gradual em toda a duração
                ])
                
                pauseBackground.zPosition = 100
                pauseBackground.position = CGPoint(x: GameViewController.screenSize.width * 0.5, y: GameViewController.screenSize.height * 0.5)
                pauseBackground.scale(to: autoScale(pauseBackground, widthProportion: 0.25, screenSize: GameViewController.screenSize))
                scene.addChild(pauseBackground)
                scene.addChild(overlayPause)
                
                closePause.zPosition = 100
                closePause.position = CGPoint(x: GameViewController.screenSize.width * -0.12, y: GameViewController.screenSize.height * 0.40)
                closePause.scale(to: autoScale(closePause, widthProportion: 0.2, screenSize: pauseBackground.size))
                pauseBackground.addChild(closePause)
                
                languages.zPosition = 100
                languages.position = CGPoint(x: GameViewController.screenSize.width * 0.05, y: GameViewController.screenSize.height * -0.06)
                languages.scale(to: autoScale(languages, widthProportion: 0.40, screenSize: pauseBackground.size))
                pauseBackground.addChild(languages)
                
                mainMenu.zPosition = 100
                mainMenu.position = CGPoint(x: GameViewController.screenSize.width * 0, y: GameViewController.screenSize.height * -0.27)
                mainMenu.scale(to: autoScale(mainMenu, widthProportion: 0.85, screenSize: pauseBackground.size))
                
                
                credits.zPosition = 100
                credits.position = CGPoint(x: GameViewController.screenSize.width * 0, y: GameViewController.screenSize.height * -0.27)
                credits.scale(to: autoScale(mainMenu, widthProportion: 0.85, screenSize: pauseBackground.size))
                
                if isIntro{
                    pauseBackground.addChild(mainMenu)
                }else{
                    pauseBackground.addChild(credits)
                }
                overlayPause.animationEntryOverlay()
                // Executar a animação "Pop In"
                pauseBackground.run(easeInAction){
                    scene.isPaused = true
                    self.isAnimating = false
                }
            }
        }
    }
    
    func closePauseButtonTapped() {
        if !isAnimating, let scene = self.scene {
            isAnimating = true
            scene.isPaused = false
            
            let easeInAction = SKAction.sequence([
                SKAction.fadeAlpha(to: 1, duration: 0),
                SKAction.fadeAlpha(to: 0, duration: 0.6)
            ])
            
            overlayPause.animationExitOverlay()
            
            // Executar a animação "Pop Out"
            pauseBackground.run(easeInAction) {
                self.closePause.removeFromParent()
                if self.isIntro{
                    self.mainMenu.removeFromParent()
                }else{
                    self.credits.removeFromParent()
                }
                self.pauseBackground.removeFromParent()
                self.languages.removeFromParent()
                self.overlayPause.removeFromParent()
                self.isAnimating = false
            }
        }
    }
}
