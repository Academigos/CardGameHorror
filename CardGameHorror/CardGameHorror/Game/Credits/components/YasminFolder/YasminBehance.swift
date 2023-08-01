import Foundation
import SpriteKit

class YasminBe: SKSpriteNode {
    let behance: SKTexture
    
    init() {
        self.behance = SKTexture(imageNamed: "Behance")
        super.init(texture: behance, color: .clear, size: behance.size())
        self.scale(to: autoScale(self, widthProportion: 0.035, screenSize: GameViewController.screenSize))
        
        isUserInteractionEnabled = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        if let url = URL(string: "https://www.behance.net/yasminsrodrigues") {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
}
