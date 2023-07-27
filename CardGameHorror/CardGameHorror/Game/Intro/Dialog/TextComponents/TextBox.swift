import SpriteKit
import UIKit

class TextBox: SKSpriteNode {
    let dialogo: TextBoxContent
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("NSCoding not supported")
    }
    
    init(dialogo: TextBoxContent) {
        self.dialogo = dialogo
        let textBoxTexture: SKTexture
        
        switch dialogo.boxType {
        case .cayla:
            textBoxTexture = SKTexture(imageNamed: "textbox_cayla")
        case .cartomante:
            textBoxTexture = SKTexture(imageNamed: "textbox_cartomante")
        }
        
        super.init(texture: textBoxTexture, color: UIColor.clear, size: textBoxTexture.size())
        self.position = CGPoint(x: GameViewController.screenSize.width * 0.5, y: GameViewController.screenSize.height * 0.305)
        self.scale(to: autoScale(self, widthProportion: 0.909, screenSize: GameViewController.screenSize))
        
        addTextContent(textContent: dialogo)
    }
    
    func addTextContent(textContent: TextBoxContent) {
        let labelContentNode = SKLabelNode()
        labelContentNode.text = textContent.content
        setupContentText(label: labelContentNode)
        
        let labelTitleNode = SKLabelNode()
        labelTitleNode.text = textContent.title
        setupTitleText(label: labelTitleNode)
        
        labelContentNode.preferredMaxLayoutWidth = size.width * 0.71
        labelContentNode.position = CGPoint(x: 0, y: -size.height * 0.09)
        
        labelTitleNode.preferredMaxLayoutWidth = size.width * 0.71
      
        if GameController.shared.getDeviceModel() == "iPhone SE"{
            labelTitleNode.position = CGPoint(x: -size.width * 0.36, y: size.height * 0.48)
        }else if GameController.shared.getDeviceModel() == "iPhone X"{
            labelTitleNode.position = CGPoint(x: -size.width * 0.30, y: size.height * 0.41)
        }else if GameController.shared.getDeviceModel() == "iPhone 11"{
            labelTitleNode.position = CGPoint(x: -size.width * 0.275, y: size.height * 0.37)
        }else if GameController.shared.getDeviceModel() == "iPhone 14"{
            labelTitleNode.position = CGPoint(x: -size.width * 0.265, y: size.height * 0.345)
        }else{
            labelTitleNode.position = CGPoint(x: -size.width * 0.287, y: size.height * 0.39)
        }
        
        addChild(labelTitleNode)
        addChild(labelContentNode)
    }
    
    private func setupContentText(label: SKLabelNode) {
        label.fontName = "BreeSerif-Regular"
        label.fontSize = 16
        label.numberOfLines = 4
        label.zPosition = 4
        label.verticalAlignmentMode = .center
        label.lineBreakMode = .byWordWrapping
        label.fontColor = .black
        label.preferredMaxLayoutWidth = 200
    }
    
    private func setupTitleText(label: SKLabelNode) {
        label.fontName = "BreeSerif-Regular"
        label.fontSize = 19
        label.numberOfLines = 4
        label.zPosition = 4
        label.verticalAlignmentMode = .center
        label.lineBreakMode = .byWordWrapping
        label.fontColor = .black
        label.preferredMaxLayoutWidth = 200
    }
    
    private func removeAllTextContent() {
        for node in children {
            node.removeFromParent()
        }
    }
    
    func showNextDialogContent(textContent: TextBoxContent) {
        removeAllTextContent()
        addTextContent(textContent: textContent)
        
        // Trocar a boxType de acordo com a do diálogo atual
        let textBoxTexture: SKTexture
        switch textContent.boxType {
        case .cayla:
            textBoxTexture = SKTexture(imageNamed: "textbox_cayla")
        case .cartomante:
            textBoxTexture = SKTexture(imageNamed: "textbox_cartomante")
        }
        texture = textBoxTexture
    }
}
