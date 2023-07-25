import SpriteKit

class IntroScene: SKScene {
    let dialogView = DialogView()
    
    override func didMove(to view: SKView) {
        addChild(dialogView)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        dialogView.handleTap()
    }
}
