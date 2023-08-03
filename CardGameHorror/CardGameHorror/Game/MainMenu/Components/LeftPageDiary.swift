//
//  leftPage.swift
//  CardGameHorror
//
//  Created by Erick Ribeiro on 26/07/23.
//

import SpriteKit

class LeftPageDiary: SKSpriteNode{
    var continueGameButtom: SKTexture
    var dataLabel: SKLabelNode = SKLabelNode()
    var textLabelPT1: SKLabelNode = SKLabelNode()
    var textLabelPT2: SKLabelNode = SKLabelNode()
    
    var diaryType: DiaryTypes = .diaryOne
    var diary: Diary?
    weak var delegate: closeOverlay?
    
    init() {
        switch diaryType {
        case .diaryOne:
            self.continueGameButtom = SKTexture(imageNamed: "diario-01-esquerda")
        case .diaryTwo:
            self.continueGameButtom = SKTexture(imageNamed: "diario-02-esquerda")
        }
        
        super.init(texture: self.continueGameButtom, color: .clear, size: self.continueGameButtom.size())
        self.scale(to: autoScale(self, widthProportion: 0.34, screenSize: GameViewController.screenSize))
        
        isUserInteractionEnabled = true
        setupDataLabel()
        setupTextLabelPT1()
        setupTextLabelPT2()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if diaryType == .diaryTwo {
            diary?.trocartextura()
        } else {
            delegate?.closeOverlay()
        }
    }
    
    func setupDataLabel() {
        dataLabel.name = "dataLabel"
        dataLabel.fontSize = max(size.height * 0.03, 12)
        dataLabel.fontName = "BreeSerif-Regular"
        dataLabel.fontColor = SKColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1.0)
        dataLabel.text = LanguageManager.shared.localizedString("03 de Agosto, 2023.")
        dataLabel.position = CGPoint(x: size.width * -0.09, y: size.height * 0.36)
        
        if GameController.shared.getDeviceModel() == "iPhone SE"{
            dataLabel.position = CGPoint(x: size.width * -0.11, y: size.height * 0.48)
        }else if GameController.shared.getDeviceModel() == "iPhone X"{
            dataLabel.position = CGPoint(x: size.width * -0.1, y: size.height * 0.38)
        }else if GameController.shared.getDeviceModel() == "iPhone 11"{
            dataLabel.position = CGPoint(x: size.width * -0.1, y: size.height * 0.33)
        }else if GameController.shared.getDeviceModel() == "iPhone 14"{
            dataLabel.position = CGPoint(x: size.width * -0.09, y: size.height * 0.36)
        }else if GameController.shared.getDeviceModel() == "iPhone 14 Pro" || GameController.shared.getDeviceModel() == "iPhone 14 Pro Max"{
            dataLabel.position = CGPoint(x: size.width * -0.10, y: size.height * 0.34)
        }else{
            dataLabel.position = CGPoint(x: size.width * -0.09, y: size.height * 0.36)
        }
        
        dataLabel.zPosition = 1.0
        addChild(dataLabel)
    }
    
    func setupTextLabelPT1() {
        textLabelPT1.name = "textLabelPt1"
        textLabelPT1.fontSize = max(size.height * 0.03, 12)
        textLabelPT1.fontName = "BreeSerif-Regular"
        textLabelPT1.numberOfLines = 0
        textLabelPT1.lineBreakMode = .byWordWrapping
        textLabelPT1.preferredMaxLayoutWidth = size.width * 0.74
        textLabelPT1.fontColor = SKColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1.0)
        textLabelPT1.text = LanguageManager.shared.localizedString("Hoje é um daqueles dias em que o peso do passado parece esmagador… Já se passaram cinco anos desde aquele fatídico acidente de carro que tirou meus amados pais de mim. Mas as vezes, ainda sinto como se estivesse presa em um pesadelo interminável, sem esperança de acordar.")
        textLabelPT1.position = CGPoint(x: self.frame.size.width * 0.09, y: size.height * -0.02)
        
        if GameController.shared.getDeviceModel() == "iPhone SE"{
            textLabelPT1.position = CGPoint(x: self.frame.size.width * 0.1, y: size.height * -0.05)
            textLabelPT1.preferredMaxLayoutWidth = size.width * 0.85
        }else if GameController.shared.getDeviceModel() == "iPhone X"{
            textLabelPT1.position = CGPoint(x: self.frame.size.width * 0.09, y: size.height * -0.02)
        }else if GameController.shared.getDeviceModel() == "iPhone 11"{
            textLabelPT1.position = CGPoint(x: self.frame.size.width * 0.09, y: size.height * -0.04)
            textLabelPT1.preferredMaxLayoutWidth = size.width * 0.716
        }else if GameController.shared.getDeviceModel() == "iPhone 14"{
            textLabelPT1.position = CGPoint(x: self.frame.size.width * 0.09, y: size.height * -0.02)
        }else if GameController.shared.getDeviceModel() == "iPhone 14 Pro" || GameController.shared.getDeviceModel() == "iPhone 14 Pro Max"{
            textLabelPT1.position = CGPoint(x: self.frame.size.width * 0.09, y: size.height * -0.02)
            textLabelPT1.preferredMaxLayoutWidth = size.width * 0.70
        }else{
            textLabelPT1.position = CGPoint(x: self.frame.size.width * 0.09, y: size.height * -0.02)
        }
        
        
        textLabelPT1.zPosition = 1.0
        addChild(textLabelPT1)
    }
    
    func setupTextLabelPT2() {
        textLabelPT2.name = "textLabelPt2"
        textLabelPT2.fontSize = max(size.height * 0.03, 12)
        textLabelPT2.fontName = "BreeSerif-Regular"
        textLabelPT2.numberOfLines = 0
        textLabelPT2.lineBreakMode = .byWordWrapping
        textLabelPT2.preferredMaxLayoutWidth = size.width * 0.74
        textLabelPT2.position = CGPoint(x: self.frame.size.width * 0.1, y: size.height * -0.38)
        
        textLabelPT2.fontColor = SKColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1.0)
        textLabelPT2.text = LanguageManager.shared.localizedString("Ainda lembro-me daquela noite escura, da rodovia vazia e mal iluminada. Daquele carro desgovernado se aproximando. Lembro-me da colisão, dos últimos momentos de meus pais no banco de trás. Mesmo depois de tantos anos, essas visões ainda são muito reais.")
        
        if GameController.shared.getDeviceModel() == "iPhone SE"{
            textLabelPT2.position = CGPoint(x: self.frame.size.width * 0.1, y: size.height * -0.52)
            textLabelPT2.preferredMaxLayoutWidth = size.width * 0.85
        }else if GameController.shared.getDeviceModel() == "iPhone X"{
            textLabelPT2.position = CGPoint(x: self.frame.size.width * 0.1, y: size.height * -0.40)
            textLabelPT2.preferredMaxLayoutWidth = size.width * 0.77
        }else if GameController.shared.getDeviceModel() == "iPhone 11"{
            textLabelPT2.position = CGPoint(x: self.frame.size.width * 0.09, y: size.height * -0.38)
            textLabelPT2.preferredMaxLayoutWidth = size.width * 0.716
        }else if GameController.shared.getDeviceModel() == "iPhone 14"{
            textLabelPT2.position = CGPoint(x: self.frame.size.width * 0.1, y: size.height * -0.38)
        } else if GameController.shared.getDeviceModel() == "iPhone 14 Pro" || GameController.shared.getDeviceModel() == "iPhone 14 Pro Max"{
            textLabelPT2.position = CGPoint(x: self.frame.size.width * 0.08, y: size.height * -0.38)
            textLabelPT2.preferredMaxLayoutWidth = size.width * 0.68
        }
        else{
            textLabelPT2.position = CGPoint(x: self.frame.size.width * 0.1, y: size.height * -0.40)
        }
        
        textLabelPT2.zPosition = 1.0
        addChild(textLabelPT2)
    }
}
