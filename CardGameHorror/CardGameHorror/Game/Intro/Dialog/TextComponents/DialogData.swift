//
//  DialogData.swift
//  CardGameHorror
//
//  Created by Giovanni Favorin de Melo on 24/07/23.
//

import Foundation

enum TextBoxType: Int {
    case cayla
    case cartomante
}

struct TextBoxContent {
    let title: String
    let content: String
    let boxType: TextBoxType
}

let dialogo: [TextBoxContent] = [
    TextBoxContent(title: "Cartomante", content: "Bem-vinda, querida. Sinto que você carrega um fardo pesado em seu coração, acredito que busque uma forma de aliviar esse peso, certo? Bem, como posso chamá-la?", boxType: .cartomante),
    TextBoxContent(title: "Cayla", content: "Olá... Meu nome é Cayla. Ouvi falar sobre suas habilidades em trazer clareza às pessoas, e, bem... estou aqui justamente por isso.", boxType: .cayla),
    TextBoxContent(title: "Cayla", content: "Há cinco anos, eu perdi meus pais em um acidente de carro terrível, causado por um motorista alcoolizado, mas que eu poderia ter evitado. Desde então, venho tendo pesadelos sobre o acidente, e é como se cada dia fosse uma batalha contra a culpa e a dor.", boxType: .cayla),
    TextBoxContent(title: "Cartomante", content: "Lamento pela sua perda, Cayla. Perder aqueles que amamos em circunstâncias tão traumáticas deixa uma marca profunda em nossa alma.", boxType: .cartomante),
    TextBoxContent(title: "Cartomante", content: "Posso te ajudar a deixar essa culpa ir, mas antes de prosseguirmos, saiba que você não tem culpa pelos atos irresponsáveis de outra pessoa. Sua decisão de dirigir naquela noite foi tomada com responsabilidade, e você não poderia prever o comportamento do outro motorista.", boxType: .cartomante),
    TextBoxContent(title: "Cartomante", content: "Bem, que tal vermos que orientação e clareza as cartas têm para você? Elas podem te mostrar o caminho para encontrar forças e seguir em frente.", boxType: .cartomante),
    TextBoxContent(title: "Cayla", content: "Claro. Eu estou disposta a tentar qualquer coisa que possa me ajudar a superar essa culpa e seguir adiante com minha vida.", boxType: .cayla),
    TextBoxContent(title: "Cartomante", content: "Muito bem, Cayla. Antes de revelar as cartas, saiba que as cartas têm um poder intuitivo, mas apenas revelam possibilidades e influências. O verdadeiro poder está em você, e em como escolhe lidar com o que é revelado.", boxType: .cartomante),
    TextBoxContent(title: "Cartomante", content: "Agora, vamos iniciar a leitura \"Caminho Através de Adversidade\".", boxType: .cartomante),
    TextBoxContent(title: "Cartomante", content: "A primeira carta representa suas metas. Aqui temos a carta da Força. Significa que você é capaz de superar o que te traz tanta dor, Cayla. Mesmo diante de lutas intensas, você tem a capacidade de se manter calma e forte, basta restaurar essa sua força.", boxType: .cartomante),
    TextBoxContent(title: "Cartomante", content: "A segunda carta representa adversidade. Aqui, o Carro invertido indica que pode haver uma falta de foco, motivação ou direção em sua jornada. O Carro também é um lembrete de que você pode alcançar a vitória, desde que tenha coragem aceitar que nem sempre estaremos no controle.", boxType: .cartomante),
    TextBoxContent(title: "Cartomante", content: "Por fim, a terceira carta representa em que você precisa focar para superar seus obstáculos. Aqui temos o Enforcado. Essa carta comunica que às vezes, precisamos abrir mão de antigas visões para encontrarmos um novo sentido em nossa jornada.", boxType: .cartomante),
    TextBoxContent(title: "Cartomante", content: "Essas são as mensagens que as cartas têm para você, querida. Lembre-se, Cayla, superar a culpa e seguir em frente não significa esquecer suas memórias ou seus pais. É sobre encontrar paz e perdão dentro de si mesma, liberando-se da culpa que não lhe pertence.", boxType: .cartomante),
    TextBoxContent(title: "Cartomante", content: "O caminho pode ser desafiador, mas você tem uma força interior notável, e nunca estará sozinha.", boxType: .cartomante),
    TextBoxContent(title: "Cayla", content: "Muito obrigada… Ainda parece difícil, mas agora sinto que tenho um novo ponto de partida para minha jornada de cura.", boxType: .cayla),
    TextBoxContent(title: "Cartomante", content: "Estou feliz em poder ajudar, Cayla. Estarei torcendo por seu sucesso nessa jornada, seja forte. Adeus.", boxType: .cartomante)
]
