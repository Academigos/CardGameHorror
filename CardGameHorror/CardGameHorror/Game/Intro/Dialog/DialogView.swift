import Foundation
import SpriteKit

class DialogView: SKNode {
    var scenary = IntroScenary(backgroundType: .room)
    let caixaTexto = TextBox(dialogo: dialogo[0])
    private var currentIndex = 0 // Índice inicial
    let maos = Maos()
    let taro = Taro()
    
    override init() {
        super.init()
        scenary.zPosition = -1
        caixaTexto.zPosition = 2
        maos.zPosition = 1
        taro.zPosition = 0
        
        addChild(scenary)
        addChild(caixaTexto)
//        addChild(maos)
//        addChild(taro)
        //startDialog()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func handleTap() {
        currentIndex += 1 // Avança para o próximo diálogo
        switch currentIndex {
        case 8:
            scenary.removeFromParent()
            scenary = IntroScenary(backgroundType: .desk)
            addChild(scenary)
        case 12:
            scenary.removeFromParent()
            scenary = IntroScenary(backgroundType: .room)
            addChild(scenary)
        default:
            break
        }
        if currentIndex < dialogo.count {
            caixaTexto.showNextDialogContent(textContent: dialogo[currentIndex])
        } else {
            GameController.shared.isCutScenePassed = true
            if let currentScene = self.scene {
                let transition = SKTransition.fade(withDuration: 0.5)
                let mainMenuScene = DayNightTransitionScene(size: currentScene.size) // Assuming MainMenuScene is the class for the scene you want to transition to.
                currentScene.view?.presentScene(mainMenuScene, transition: transition)
            }
            // O diálogo terminou, você pode executar alguma ação ou remover a caixa de texto se desejar.
            caixaTexto.removeFromParent()
        }
    }
}
