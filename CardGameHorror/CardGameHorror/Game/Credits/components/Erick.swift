import Foundation
import SpriteKit

/// Classe responsável por tratar o node de créditos do Erick
class Erick: SKSpriteNode {
    let erick: SKTexture
    
    init() {
        self.erick = SKTexture(imageNamed: "CreditosErick")
        super.init(texture: erick, color: .clear, size: erick.size())
        self.scale(to: autoScale(self, widthProportion: 0.22, screenSize: GameViewController.screenSize))
        
        isUserInteractionEnabled = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        if let url = URL(string: "https://www.linkedin.com/in/erickrib/") {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
}
