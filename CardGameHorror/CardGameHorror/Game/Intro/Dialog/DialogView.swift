import Foundation
import SpriteKit

class DialogView: SKNode {
    var scenary = IntroScenary(backgroundType: .room)
    let caixaTexto = TextBox(dialogo: dialogo[0])
    private var currentIndex = 0 // Índice inicial
    
    
    override init() {
        super.init()
        
        addChild(scenary)
        addChild(caixaTexto)
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
            // O diálogo terminou, você pode executar alguma ação ou remover a caixa de texto se desejar.
            caixaTexto.removeFromParent()
        }
    }
}
