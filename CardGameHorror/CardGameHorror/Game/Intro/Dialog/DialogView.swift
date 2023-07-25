import Foundation
import SpriteKit

class DialogView: SKNode {
    var scenary = IntroScenary(backgroundType: .room)
    let caixaTexto = TextBox(dialogo: dialogo[0])
    private var currentIndex = 0 // Índice inicial
    let maos = Maos()
    let taro = Taro()
    // Propriedades para os emitters de partículas
    var particleEmitters: [SKEmitterNode] = []
    
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
        
        setupParticleFire()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupParticleFire(){
        // Adicionar 4 emitters de partículas em diferentes posições
        let positions: [CGPoint] = [
            CGPoint(x: GameViewController.screenSize.width * 0.292, y: GameViewController.screenSize.height * 0.551),
            CGPoint(x: GameViewController.screenSize.width  * 0.706, y: GameViewController.screenSize.height * 0.551),
            CGPoint(x: GameViewController.screenSize.width * 0.317, y: GameViewController.screenSize.height * 0.483),
            CGPoint(x: GameViewController.screenSize.width  * 0.682, y: GameViewController.screenSize.height * 0.483),
        ]
        
        for position in positions {
            addParticleEmitter(at: position)
        }
    }
    
    func addParticleEmitter(at position: CGPoint) {
        
        if let emitterPath = Bundle.main.path(forResource: "MyParticle", ofType: "sks"),
           let emitterData = NSData(contentsOfFile: emitterPath),
           let emitter = try? NSKeyedUnarchiver.unarchivedObject(ofClass: SKEmitterNode.self, from: emitterData as Data) {
            emitter.position = position
            emitter.targetNode = self
            addChild(emitter)
            particleEmitters.append(emitter)
        }
    }
    
    func removeAllParticleEmitters() {
        for emitter in particleEmitters {
            emitter.removeFromParent()
        }
        particleEmitters.removeAll()
    }
    
    func handleTap() {
        currentIndex += 1 // Avança para o próximo diálogo
        switch currentIndex {
        case 8:
            scenary.removeFromParent()
            scenary = IntroScenary(backgroundType: .desk)
            removeAllParticleEmitters()
            addChild(scenary)
        case 12:
            scenary.removeFromParent()
            scenary = IntroScenary(backgroundType: .room)
            setupParticleFire()
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
