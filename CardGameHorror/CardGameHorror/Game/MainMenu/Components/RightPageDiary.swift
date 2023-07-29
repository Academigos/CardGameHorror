//
//  RightPageDyariOne.swift
//  CardGameHorror
//
//  Created by Erick Ribeiro on 26/07/23.
//

import SpriteKit

class RightPageDiary: SKSpriteNode{
    var continueGameButtom: SKTexture
    var continueLabel: SKLabelNode = SKLabelNode()
    
    var textLabelPT1: SKLabelNode = SKLabelNode()
    var textLabelPT2: SKLabelNode = SKLabelNode()
    var textLabelPT3: SKLabelNode = SKLabelNode()
    var textLabelPT4: SKLabelNode = SKLabelNode()
    var labelCartomante: SKLabelNode = SKLabelNode()
    var labelPhone: SKLabelNode = SKLabelNode()
    var labelAdress: SKLabelNode = SKLabelNode()
    
    var diaryType: DiaryTypes = .diaryOne
    var diary: Diary?
    
    var continueButtonDiary: ContinueButtonDiary = ContinueButtonDiary()
    init() {
        switch diaryType {
        case .diaryOne:
            self.continueGameButtom = SKTexture(imageNamed: "diario-01-direita")
        case .diaryTwo:
            self.continueGameButtom = SKTexture(imageNamed: "diario-02-direita")
        }
        
        super.init(texture: self.continueGameButtom, color: .clear, size: self.continueGameButtom.size())
        self.scale(to: autoScale(self, widthProportion: 0.34, screenSize: GameViewController.screenSize))
        //setupContinueLabel()
        
        isUserInteractionEnabled = true
        setupTextLabelPT1()
        setupTextLabelPT2()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if diaryType == .diaryOne {
            diary?.trocartextura()
            setupButtonContinue()
        }
    }
    
    private func setupContinueLabel() {
        continueLabel.name = "ContinueLabel"
        continueLabel.fontSize = size.height * 0.12
        continueLabel.fontName = "BreeSerif-Regular"
        continueLabel.fontColor = SKColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1.0)
        continueLabel.text = LanguageManager.shared.localizedString("Continuar")
        continueLabel.position = CGPoint(x: size.width * 0.11, y: size.height * -0.43)
        continueLabel.zPosition = 1.0
        addChild(continueLabel)
    }
    
    func setupButtonContinue(){
        addChild(continueButtonDiary)
        continueButtonDiary.zPosition = 6
        continueButtonDiary.position = CGPoint(x: size.width * 0.03, y: size.height * -0.33)
        if GameController.shared.getDeviceModel() == "iPhone SE"{
            continueButtonDiary.position = CGPoint(x: size.width * 0.03, y: size.height * -0.39)
        }else if GameController.shared.getDeviceModel() == "iPhone X"{
            continueButtonDiary.position = CGPoint(x: size.width * 0.03, y: size.height * -0.33)
        }else if GameController.shared.getDeviceModel() == "iPhone 11"{
            continueButtonDiary.position = CGPoint(x: size.width * 0.03, y: size.height * -0.31)
        }else if GameController.shared.getDeviceModel() == "iPhone 14"{
            continueButtonDiary.position = CGPoint(x: size.width * 0.03, y: size.height * -0.33)
        } else if GameController.shared.getDeviceModel() == "iPhone 14 Pro" || GameController.shared.getDeviceModel() == "iPhone 14 Pro Max"{
            continueButtonDiary.position = CGPoint(x: size.width * 0.03, y: size.height * -0.30)
        }
        else{
            continueButtonDiary.position = CGPoint(x: size.width * 0.03, y: size.height * -0.33)
        }
        
    }
    
    func setupTextLabelPT1() {
        textLabelPT1.name = "textLabelPt1"
        textLabelPT1.fontSize = max(size.height * 0.03, 12)
        textLabelPT1.fontName = "BreeSerif-Regular"
        textLabelPT1.numberOfLines = 0
        textLabelPT1.lineBreakMode = .byWordWrapping
        textLabelPT1.preferredMaxLayoutWidth = size.width * 0.75
        textLabelPT1.fontColor = SKColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1.0)
        textLabelPT1.text = LanguageManager.shared.localizedString("Sei que aquele motorista incompetente já está pagando pelo que fez, mas isso não é o suficiente para me tranquilizar. Pelo menos não quando eu sei que se tivesse reagido mais rapidamente tudo aquilo poderia ter sido evitado. Havia tempo o suficiente para salvar meus pais, mas a impotência que senti naquele momento foi sufocante, e essa sensação de culpa me assombra todos os dias.")
        textLabelPT1.position = CGPoint(x: size.width * -0.083, y: size.height * -0.09)
        
        if GameController.shared.getDeviceModel() == "iPhone SE"{
            textLabelPT1.position = CGPoint(x: size.width * -0.083, y: size.height * -0.09)
            textLabelPT1.preferredMaxLayoutWidth = size.width * 0.95
        }else if GameController.shared.getDeviceModel() == "iPhone X"{
            textLabelPT1.position = CGPoint(x: size.width * -0.083, y: size.height * -0.11)
        }else if GameController.shared.getDeviceModel() == "iPhone 11"{
            textLabelPT1.position = CGPoint(x: size.width * -0.083, y: size.height * -0.09)
            textLabelPT1.preferredMaxLayoutWidth = size.width * 0.70
        }else if GameController.shared.getDeviceModel() == "iPhone 14"{
            textLabelPT1.position = CGPoint(x: size.width * -0.083, y: size.height * -0.09)
        } else if GameController.shared.getDeviceModel() == "iPhone 14 Pro" || GameController.shared.getDeviceModel() == "iPhone 14 Pro Max"{
            textLabelPT1.position = CGPoint(x: size.width * -0.07, y: size.height * -0.065)
            textLabelPT1.preferredMaxLayoutWidth = size.width * 0.7
        }
        else{
            textLabelPT1.position = CGPoint(x: size.width * -0.083, y: size.height * -0.09)
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
        textLabelPT2.preferredMaxLayoutWidth = size.width * 0.75
        textLabelPT2.fontColor = SKColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1.0)
        textLabelPT2.text = LanguageManager.shared.localizedString("Já tentei acalmar meu coração de tantas formas… Meus amigos tem me recomendado procurar ajudar profissional para lidar com esse trauma, mas não me sinto pronta para voltar a falar sobre esse desastre.")
        textLabelPT2.position = CGPoint(x: size.width * -0.08, y: size.height * -0.38)
        
        if GameController.shared.getDeviceModel() == "iPhone SE"{
            textLabelPT2.position = CGPoint(x: size.width * -0.08, y: size.height * -0.45)
            textLabelPT2.preferredMaxLayoutWidth = size.width * 0.95
        }else if GameController.shared.getDeviceModel() == "iPhone X"{
            textLabelPT2.position = CGPoint(x: size.width * -0.08, y: size.height * -0.4)
        }else if GameController.shared.getDeviceModel() == "iPhone 11"{
            textLabelPT2.position = CGPoint(x: size.width * -0.08, y: size.height * -0.38)
            textLabelPT2.preferredMaxLayoutWidth = size.width * 0.71
        }else if GameController.shared.getDeviceModel() == "iPhone 14"{
            textLabelPT2.position = CGPoint(x: size.width * -0.08, y: size.height * -0.4)
        } else if GameController.shared.getDeviceModel() == "iPhone 14 Pro" || GameController.shared.getDeviceModel() == "iPhone 14 Pro Max"{
            textLabelPT2.position = CGPoint(x: size.width * -0.07, y: size.height * -0.35)
            textLabelPT2.preferredMaxLayoutWidth = size.width * 0.7
        }
        else{
            textLabelPT2.position = CGPoint(x: size.width * -0.08, y: size.height * -0.38)
        }
        
        
        textLabelPT2.zPosition = 1.0
        addChild(textLabelPT2)
    }
    
    func setupTextLabelPT3() {
        textLabelPT3.name = "textLabelPt3"
        textLabelPT3.fontSize = max(size.height * 0.03, 12)
        textLabelPT3.fontName = "BreeSerif-Regular"
        textLabelPT3.numberOfLines = 0
        textLabelPT3.lineBreakMode = .byWordWrapping
        textLabelPT3.preferredMaxLayoutWidth = size.width * 0.78
        textLabelPT3.fontColor = SKColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1.0)
        textLabelPT3.text = LanguageManager.shared.localizedString("Recentemente consegui o contato de uma cartomante experiente, que tem um dom especial para ajudar pessoas como eu.")
        textLabelPT3.position = CGPoint(x: size.width * -0.083, y: size.height * 0.27)
        textLabelPT3.zPosition = 1.0
        
        if GameController.shared.getDeviceModel() == "iPhone SE"{
            textLabelPT3.position = CGPoint(x: size.width * -0.088, y: size.height * 0.30)
            textLabelPT3.preferredMaxLayoutWidth = size.width * 0.96
        }else if GameController.shared.getDeviceModel() == "iPhone X"{
            textLabelPT3.position = CGPoint(x: size.width * -0.11, y: size.height * 0.23)
            textLabelPT3.preferredMaxLayoutWidth = size.width * 0.78
        }else if GameController.shared.getDeviceModel() == "iPhone 11"{
            textLabelPT3.position = CGPoint(x: size.width * -0.09, y: size.height * 0.23)
            textLabelPT3.preferredMaxLayoutWidth = size.width * 0.71
        }else if GameController.shared.getDeviceModel() == "iPhone 14"{
            textLabelPT3.position = CGPoint(x: size.width * -0.083, y: size.height * 0.26)
        } else if GameController.shared.getDeviceModel() == "iPhone 14 Pro" || GameController.shared.getDeviceModel() == "iPhone 14 Pro Max"{
            textLabelPT3.position = CGPoint(x: size.width * -0.09, y: size.height * 0.22)
            textLabelPT3.preferredMaxLayoutWidth = size.width * 0.68
        }
        else{
            textLabelPT3.position = CGPoint(x: size.width * -0.083, y: size.height * 0.27)
        }
        
        
        addChild(textLabelPT3)
    }
    
    func setupTextLabelPT4() {
        textLabelPT4.name = "textLabelPt4"
        textLabelPT4.fontSize = max(size.height * 0.03, 12)
        textLabelPT4.fontName = "BreeSerif-Regular"
        textLabelPT4.numberOfLines = 0
        textLabelPT4.lineBreakMode = .byWordWrapping
        textLabelPT4.preferredMaxLayoutWidth = size.width * 0.75
        textLabelPT4.fontColor = SKColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1.0)
        textLabelPT4.text = LanguageManager.shared.localizedString("Talvez uma visita possa me trazer uma nova perspectiva ou orientação sobre como lidar melhor com essa culpa, afinal, o espiritual sempre foi de grande ajuda para mim.")
        textLabelPT4.position = CGPoint(x: size.width * -0.083, y: size.height * 0)
        textLabelPT4.zPosition = 1.0
        
        if GameController.shared.getDeviceModel() == "iPhone SE"{
            textLabelPT4.position = CGPoint(x: size.width * -0.1, y: size.height * -0.03)
            textLabelPT4.preferredMaxLayoutWidth = size.width * 0.92
        }else if GameController.shared.getDeviceModel() == "iPhone X"{
            textLabelPT4.position = CGPoint(x: size.width * -0.083, y: size.height * -0.05)
            textLabelPT4.preferredMaxLayoutWidth = size.width * 0.78
        }else if GameController.shared.getDeviceModel() == "iPhone 11"{
            textLabelPT4.position = CGPoint(x: size.width * -0.1, y: size.height * -0.02)
            textLabelPT4.preferredMaxLayoutWidth = size.width * 0.68
        }else if GameController.shared.getDeviceModel() == "iPhone 14"{
            textLabelPT4.position = CGPoint(x: size.width * -0.083, y: size.height * 0)
        } else if GameController.shared.getDeviceModel() == "iPhone 14 Pro" || GameController.shared.getDeviceModel() == "iPhone 14 Pro Max"{
            textLabelPT4.position = CGPoint(x: size.width * -0.079, y: size.height * -0.02)
            textLabelPT4.preferredMaxLayoutWidth = size.width * 0.68
        }
        else{
            textLabelPT4.position = CGPoint(x: size.width * -0.083, y: size.height * 0)
        }
        addChild(textLabelPT4)
    }
    
    func setupTextLabelCartomante() {
        let angleInRadians = -7.55 * CGFloat.pi / 180.0
        
        labelCartomante.name = "textLabelCartomante"
        labelCartomante.fontSize = max(size.height * 0.028, 10)
        labelCartomante.fontName = "BreeSerif-Regular"
        labelCartomante.fontColor = SKColor(red: 132/255, green: 88/255, blue: 60/255, alpha: 1.0)
        labelCartomante.text = LanguageManager.shared.localizedString("Cartomante")
        labelCartomante.position = CGPoint(x: size.width * 0.065, y: size.height * -0.13)
        labelCartomante.zPosition = 1.0
        labelCartomante.zRotation = angleInRadians
        
        if GameController.shared.getDeviceModel() == "iPhone SE"{
            labelCartomante.position = CGPoint(x: size.width * 0.095, y: size.height * -0.16)
        }else if GameController.shared.getDeviceModel() == "iPhone X"{
            labelCartomante.position = CGPoint(x: size.width * 0.065, y: size.height * -0.13)
        }else if GameController.shared.getDeviceModel() == "iPhone 11"{
            labelCartomante.position = CGPoint(x: size.width * 0.065, y: size.height * -0.13)
        }else if GameController.shared.getDeviceModel() == "iPhone 14"{
            labelCartomante.position = CGPoint(x: size.width * 0.065, y: size.height * -0.13)
        } else if GameController.shared.getDeviceModel() == "iPhone 14 Pro"{
            labelCartomante.position = CGPoint(x: size.width * 0.065, y: size.height * -0.13)
        }
        else{
            labelCartomante.position = CGPoint(x: size.width * 0.065, y: size.height * -0.13)
        }
        
        addChild(labelCartomante)
    }
    
    func setupTextLabelPhone() {
        let angleInRadians = -7.55 * CGFloat.pi / 180.0
        
        labelPhone.name = "textLabelCartomante"
        labelPhone.fontSize = max(size.height * 0.028, 10)
        labelPhone.fontName = "BreeSerif-Regular"
        labelPhone.fontColor = SKColor(red: 175/255, green: 125/255, blue: 94/255, alpha: 1.0)
        labelPhone.text = LanguageManager.shared.localizedString("(XX) XXXX - XXXX")
        labelPhone.position = CGPoint(x: size.width * 0.06, y: size.height * -0.2)
        labelPhone.zPosition = 1.0
        labelPhone.zRotation = angleInRadians
        
        if GameController.shared.getDeviceModel() == "iPhone SE"{
            labelPhone.position = CGPoint(x: size.width * 0.07, y: size.height * -0.25)
        }else if GameController.shared.getDeviceModel() == "iPhone X"{
            labelPhone.position = CGPoint(x: size.width * 0.06, y: size.height * -0.2)
        }else if GameController.shared.getDeviceModel() == "iPhone 11"{
            labelPhone.position = CGPoint(x: size.width * 0.06, y: size.height * -0.2)
        }else if GameController.shared.getDeviceModel() == "iPhone 14"{
            labelPhone.position = CGPoint(x: size.width * 0.06, y: size.height * -0.2)
        } else if GameController.shared.getDeviceModel() == "iPhone 14 Pro"{
            labelPhone.position = CGPoint(x: size.width * 0.06, y: size.height * -0.2)
        }
        else{
            labelPhone.position = CGPoint(x: size.width * 0.06, y: size.height * -0.2)
        }
        
        addChild(labelPhone)
    }
    
    func setupTextLabelAdress() {
        let angleInRadians = -7.55 * CGFloat.pi / 180.0
        
        labelAdress.name = "textLabelCartomante"
        labelAdress.fontSize = max(size.height * 0.022, 8)
        labelAdress.fontName = "BreeSerif-Regular"
        labelAdress.fontColor = SKColor(red: 175/255, green: 125/255, blue: 94/255, alpha: 1.0)
        labelAdress.text = LanguageManager.shared.localizedString("Avenida Estrela d’alva, 303")
        labelAdress.position = CGPoint(x: size.width * 0.05, y: size.height * -0.25)
        labelAdress.zPosition = 1.0
        labelAdress.zRotation = angleInRadians
        
        if GameController.shared.getDeviceModel() == "iPhone SE"{
            labelAdress.position = CGPoint(x: size.width * 0.06, y: size.height * -0.30)
        }else if GameController.shared.getDeviceModel() == "iPhone X"{
            labelAdress.position = CGPoint(x: size.width * 0.05, y: size.height * -0.25)
        }else if GameController.shared.getDeviceModel() == "iPhone 11"{
            labelAdress.position = CGPoint(x: size.width * 0.05, y: size.height * -0.25)
        }else if GameController.shared.getDeviceModel() == "iPhone 14"{
            labelAdress.position = CGPoint(x: size.width * 0.05, y: size.height * -0.25)
        } else if GameController.shared.getDeviceModel() == "iPhone 14 Pro"{
            labelAdress.position = CGPoint(x: size.width * 0.04, y: size.height * -0.25)
            labelAdress.fontSize = max(size.height * 0.018, 8)
        }
        else{
            labelPhone.position = CGPoint(x: size.width * 0.06, y: size.height * -0.2)
        }
        
        addChild(labelAdress)
    }
}


import SpriteKit

class ContinueButtonDiary: SKSpriteNode {
    weak var delegate: NewGameButtomDelegate?
    var continueGameButtom: SKLabelNode = SKLabelNode()
    
    var continueButton: SKTexture
    init() {
        continueButton = SKTexture(imageNamed: "fundo_continuar_diario")
        super.init(texture: self.continueButton, color: .clear, size: self.continueButton.size())
        
        isUserInteractionEnabled = true
        setupContinueIntroLabel()
        
        print(size.width)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        continueButtonTapped()
    }
    
    func continueButtonTapped() {
        GameController.shared.startNewGame()
        delegate?.newGameButtonTapped()
    }
    
    func setupContinueIntroLabel() {
        let angleInRadians = -7.55 * CGFloat.pi / 180.0
        
        continueGameButtom.name = "textLabelCartomante"
        continueGameButtom.fontSize = max(size.height * 0.028, 16)
        continueGameButtom.fontName = "BigshotOne-Regular"
        continueGameButtom.fontColor = SKColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1.0)
        continueGameButtom.text = LanguageManager.shared.localizedString("Continuar")
        continueGameButtom.position = CGPoint(x: 0, y: 0)
        continueGameButtom.zPosition = 1.0
        continueGameButtom.zRotation = angleInRadians
        addChild(continueGameButtom)
        
        let scaleUpAction = SKAction.scale(to: 1.0, duration: 0.7)
        let scaleDownAction = SKAction.scale(to: 0.8, duration: 0.7)

        // Crie a ação de pulsação para sempre, repetindo as ações em sequência
        let pulseForeverAction = SKAction.repeatForever(SKAction.sequence([scaleUpAction, scaleDownAction]))

        // Aplique a ação de pulsação ao SKLabelNode
        continueGameButtom.run(pulseForeverAction)
    }
}

