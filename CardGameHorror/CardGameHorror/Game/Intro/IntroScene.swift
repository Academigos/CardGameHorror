import SpriteKit

///scene para a introdução narrativa
class IntroScene: SKScene {
    let dialogView = DialogView()
    let pause = MainPause(isIntro: true, currentScene: "Intro")
    let skip = SkipButtom()
    override func didMove(to view: SKView) {
        addChild(dialogView)
        pause.zPosition = 100
        addChild(pause)
        addChild(skip)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        dialogView.handleTap()
    }
}
