import Foundation
import SpriteKit

/// Classe responsável por tratar o node de créditos do Felipe
class Felipe: SKSpriteNode {
    let felipe: SKTexture
    
    init() {
        self.felipe = SKTexture(imageNamed: "CreditosFelipe")
        super.init(texture: felipe, color: .clear, size: felipe.size())
        self.scale(to: autoScale(self, widthProportion: 0.22, screenSize: GameViewController.screenSize))
        
        isUserInteractionEnabled = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        if let url = URL(string: "https://www.instagram.com/fe.lipe_z/") {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
}
