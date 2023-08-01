import Foundation
import SpriteKit

/// Classe responsável por tratar o node de créditos do Giovanni
class Giovanni: SKSpriteNode {
    let giovanni: SKTexture
    
    init() {
        self.giovanni = SKTexture(imageNamed: "CreditosGiovanni")
        super.init(texture: giovanni, color: .clear, size: giovanni.size())
        self.scale(to: autoScale(self, widthProportion: 0.22, screenSize: GameViewController.screenSize))
        
        isUserInteractionEnabled = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        if let url = URL(string: "https://www.linkedin.com/in/giovannifavorin/") {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
}
