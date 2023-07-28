//
//  DialogBox.swift
//  CardGameHorror
//
//  Created by Luiz Felipe on 27/07/23.
//

import SpriteKit

class DialogBox:SKSpriteNode{
    let dialogBox : SKTexture
    
    init(dialogBox: String) {
        self.dialogBox = SKTexture(imageNamed: dialogBox)
        super.init(texture: self.dialogBox, color: .clear, size: self.dialogBox.size())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addTextContent(textContent: String, cor:UIColor) {
        let labelContentNode = SKLabelNode()
        labelContentNode.text = textContent
        setupContentText(label: labelContentNode, cor: cor, textContent: textContent)
        labelContentNode.preferredMaxLayoutWidth = size.width * 0.5
        labelContentNode.position = CGPoint(x: 0, y: size.height * 0)
        labelContentNode.verticalAlignmentMode = .center
        self.addChild(labelContentNode)
    }
    
    private func setupContentText(label: SKLabelNode, cor:UIColor,textContent: String) {
        //funcao centralizar
        let text =  textContent
        let font = UIFont(name: "BreeSerif-Regular", size: 12)

        if let customFont = font {
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.alignment = .center
            let attrString = NSMutableAttributedString(string: text, attributes: [
                .font: customFont,
                .foregroundColor: cor,
                .paragraphStyle: paragraphStyle
            ])
            
            label.attributedText = attrString
        } else {
            label.text = text
        }
        label.fontName = "BreeSerif-Regular"
        label.fontSize = 12
        label.numberOfLines = 12
        label.zPosition = 4
        label.horizontalAlignmentMode = .center
        label.verticalAlignmentMode = .center
        label.lineBreakMode = .byWordWrapping
        //label.fontColor = cor
        label.preferredMaxLayoutWidth = 120
    }
}
