import Foundation
import SpriteKit

///Classe para gerir todos os componentes da experiência de diálogo
class DialogView: SKNode {
    var scenary = IntroScenary(backgroundType: .room)
    let caixaTexto = TextBox(dialogo: dialogo[0])
    var currentIndex = 0
    let maos = Maos()
    // Propriedades para os emitters de partículas
    var particleEmitters: [SKEmitterNode] = []
    let carta1 = Taro(carta: .carta1)
    let carta2 = Taro(carta: .carta2)
    let carta3 = Taro(carta: .carta3)
    private var isWaitingForDialog = false
    
    override init() {
        super.init()
        
        addChild(scenary)
        setupParticleFire()
        Timer.scheduledTimer(withTimeInterval: 1.2, repeats: false) { [self]_ in
            addChild(caixaTexto)
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupParticleFire() {
        // Adicionar 4 emitters de partículas em diferentes posições
        var positions: [CGPoint] = [
            CGPoint(x: GameViewController.screenSize.width * 0.292, y: GameViewController.screenSize.height * 0.551),
            CGPoint(x: GameViewController.screenSize.width  * 0.706, y: GameViewController.screenSize.height * 0.551),
            CGPoint(x: GameViewController.screenSize.width * 0.317, y: GameViewController.screenSize.height * 0.483),
            CGPoint(x: GameViewController.screenSize.width  * 0.682, y: GameViewController.screenSize.height * 0.483),
        ]
        
        if GameController.shared.getDeviceModel() == "iPhone SE" {
            positions = [
                CGPoint(x: GameViewController.screenSize.width * 0.237, y: GameViewController.screenSize.height * 0.551),
                CGPoint(x: GameViewController.screenSize.width  * 0.762, y: GameViewController.screenSize.height * 0.551),
                CGPoint(x: GameViewController.screenSize.width * 0.27, y: GameViewController.screenSize.height * 0.483),
                CGPoint(x: GameViewController.screenSize.width  * 0.73, y: GameViewController.screenSize.height * 0.483),
            ]
        }
        
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
        if isWaitingForDialog {
            return // Ignora cliques enquanto está esperando o Timer
        }
        
        currentIndex += 1
        switch currentIndex {
        case 8:
            scenary.removeFromParent()
            scenary = IntroScenary(backgroundType: .desk)
            removeAllParticleEmitters()
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
            Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { [self]_ in
                self.caixaTexto.isHidden = false
                isUserInteractionEnabled = true
            }
        case 11:
            self.caixaTexto.isHidden = true
            isUserInteractionEnabled = false
            addChild(carta3)
            Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { [self]_ in
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
            setupParticleFire()
            addChild(scenary)
        default: break
        }
        
        if currentIndex < dialogo.count {
            caixaTexto.showNextDialogContent(textContent: dialogo[currentIndex])
        } else {
            GameController.isCutScenePassed = true
            caixaTexto.removeFromParent()
            if let currentScene = self.scene {
                let transition = SKTransition.fade(withDuration: 0.5)
                let mainMenuScene = DayNightTransitionScene(size: currentScene.size)
                currentScene.view?.presentScene(mainMenuScene, transition: transition)
            }
        }
    }
}
