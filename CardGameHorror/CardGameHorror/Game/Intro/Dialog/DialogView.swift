import Foundation
import SpriteKit

class DialogView: SKNode {
    var scenary = IntroScenary(backgroundType: .room)
    let caixaTexto = TextBox(dialogo: dialogo[0])
    var currentIndex = 0 // Índice inicial
    let maos = Maos()
    let carta1 = Taro(carta: .carta1)
    let carta2 = Taro(carta: .carta2)
    let carta3 = Taro(carta: .carta3)
    private var isWaitingForDialog = false // Variável para controlar se está esperando o Timer
    
    
    override init() {
        super.init()
        
        addChild(scenary)
        Timer.scheduledTimer(withTimeInterval: 1.2, repeats: false) { [self]_ in
            addChild(caixaTexto)
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func handleTap() {
        if isWaitingForDialog {
            return // Ignora cliques enquanto está esperando o Timer
        }
        
        currentIndex += 1 // Avança para o próximo diálogo
        switch currentIndex {
        case 8:
            scenary.removeFromParent()
            scenary = IntroScenary(backgroundType: .desk)
            addChild(scenary)
            addChild(maos)
        case 9:
            self.caixaTexto.isHidden = true
            isUserInteractionEnabled = false
            Timer.scheduledTimer(withTimeInterval: 0.2, repeats: false) { [self]_ in
                self.maos.animacaoAbrindoMao()
                Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { [self]_ in
                    self.addChild(self.carta1)
                }
            }
            
            Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { [self]_ in
                self.caixaTexto.isHidden = false
                isUserInteractionEnabled = true
            }
        case 10:
            self.caixaTexto.isHidden = true
            isUserInteractionEnabled = false
            addChild(carta2)
            Timer.scheduledTimer(withTimeInterval: 1.2, repeats: false) { [self]_ in
                self.caixaTexto.isHidden = false
                isUserInteractionEnabled = true
            }
        case 11:
            self.caixaTexto.isHidden = true
            isUserInteractionEnabled = false
            addChild(carta3)
            Timer.scheduledTimer(withTimeInterval: 1.2, repeats: false) { [self]_ in
                self.caixaTexto.isHidden = false
                isUserInteractionEnabled = true
            }
        case 12:
            carta1.removeFromParent()
            carta2.removeFromParent()
            carta3.removeFromParent()
            maos.removeFromParent()
            scenary.removeFromParent()
            scenary = IntroScenary(backgroundType: .room)
            addChild(scenary)
        default: break
        }
        
        if currentIndex < dialogo.count {
            
            isUserInteractionEnabled = false
            isWaitingForDialog = true
            Timer.scheduledTimer(withTimeInterval: 1.2, repeats: false) { [self]_ in
                caixaTexto.showNextDialogContent(textContent: dialogo[currentIndex])
                isUserInteractionEnabled = true
                isWaitingForDialog = false // Terminou a espera, permite interação novamente
            }
        } else {
            GameController.isCutScenePassed = true
            // O diálogo terminou, você pode executar alguma ação ou remover a caixa de texto se desejar.
            caixaTexto.removeFromParent()
            if let currentScene = self.scene {
                let transition = SKTransition.fade(withDuration: 0.5)
                let mainMenuScene = DayNightTransitionScene(size: currentScene.size)
                currentScene.view?.presentScene(mainMenuScene, transition: transition)
            }
        }
    }
}
