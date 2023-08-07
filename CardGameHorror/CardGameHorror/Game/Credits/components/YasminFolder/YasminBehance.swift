import Foundation
import SpriteKit

///classe que define o comportamento do link do behance da yasmin
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
        let alertController = UIAlertController(title: "Leave the game?", message: "Do you want to open the link and leave the game?", preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "No", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        
        let openLinkAction = UIAlertAction(title: "Yes", style: .default) { _ in
            if let url = URL(string: "https://www.behance.net/yasminsrodrigues") {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }
        alertController.addAction(openLinkAction)
        
        // Get the topmost window scene and then the topmost window to present the alert
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let topWindow = windowScene.windows.first(where: { $0.isKeyWindow }) {
            topWindow.rootViewController?.present(alertController, animated: true, completion: nil)
        }
    }
}
