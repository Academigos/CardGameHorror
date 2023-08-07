//
//  Diary.swift
//  CardGameHorror
//
//  Created by Erick Ribeiro on 27/07/23.
//

import SpriteKit

//Enum para cada textura de página da Apple
enum DiaryTypes: String {
    case diaryOne
    case diaryTwo
}

///Classe que define o comportamento do Diário
class Diary: SKNode {
    let rightPage = RightPageDiary()
    var leftPage = LeftPageDiary()
    let diarySong = SKAudioNode(fileNamed: "pagina_livro_sfx")
    
    override init() {
        super.init()
        addChild(leftPage)
        leftPage.position = CGPoint(x: GameViewController.screenSize.width * -0.16, y: 0)
        addChild(rightPage)
        rightPage.position = CGPoint(x: GameViewController.screenSize.width * 0.18, y: 0)
        
        rightPage.diary = self
        leftPage.diary = self
        
        //adicao do som 
        diarySong.autoplayLooped = false
        self.addChild(diarySong)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //troca de textura das páginas
    func trocartextura(){
        if leftPage.diaryType == .diaryOne {
            leftPage.diaryType = .diaryTwo
        } else {
            leftPage.diaryType = .diaryOne
        }
        
        if rightPage.diaryType == .diaryOne {
            rightPage.diaryType = .diaryTwo
        } else {
            rightPage.diaryType = .diaryOne
        }
        
        switch rightPage.diaryType {
        case .diaryOne:
            rightPage.continueGameButtom = SKTexture(imageNamed: "diario-01-direita")
            rightPage.continueButtonDiary.removeFromParent()
            rightPage.setupTextLabelPT1()
            rightPage.setupTextLabelPT2()
            rightPage.labelCartomante.removeFromParent()
            rightPage.labelPhone.removeFromParent()
            rightPage.labelAdress.removeFromParent()
            rightPage.textLabelPT3.removeFromParent()
            rightPage.textLabelPT4.removeFromParent()
        case .diaryTwo:
            rightPage.continueGameButtom = SKTexture(imageNamed: "diario-02-direita")
            rightPage.setupTextLabelPT3()
            rightPage.setupTextLabelPT4()
            rightPage.setupTextLabelCartomante()
            rightPage.setupTextLabelPhone()
            rightPage.setupTextLabelAdress()
            rightPage.textLabelPT1.removeFromParent()
            rightPage.textLabelPT2.removeFromParent()
        }
        
        switch leftPage.diaryType {
        case .diaryOne:
            leftPage.continueGameButtom = SKTexture(imageNamed: "diario-01-esquerda")
            leftPage.setupDataLabel()
            leftPage.setupTextLabelPT1()
            leftPage.setupTextLabelPT2()
        case .diaryTwo:
            leftPage.continueGameButtom = SKTexture(imageNamed: "diario-02-esquerda")
            leftPage.dataLabel.removeFromParent()
            leftPage.textLabelPT1.removeFromParent()
            leftPage.textLabelPT2.removeFromParent()
        }
        
        // Defina a nova textura do nó após a mudança do diaryType
        rightPage.texture = rightPage.continueGameButtom
        leftPage.texture = leftPage.continueGameButtom
        
        //ativamento do som
        diarySong.run(SKAction.play())
    }
}
