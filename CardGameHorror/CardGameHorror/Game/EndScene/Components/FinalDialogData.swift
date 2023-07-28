//
//  FinalDialogData.swift
//  CardGameHorror
//
//  Created by Luiz Felipe on 26/07/23.
//

import Foundation

enum ResultadoBattle:Int{
    case vitoria, derrota
}

struct FinalDialogs{
    let texto:String
    let resultado:ResultadoBattle
}

let dialogoFinal:[FinalDialogs] = [FinalDialogs(texto: "Essa noite, me deparei novamente com aquele pesadelo horrível, e, dessa vez, foi mais avassalador do que nunca. Me senti impotente mais uma vez, e sinto que fracassei, mas também percebi, enfim, que não posso mais lutar sozinha contra isso. Vou ouvir meus amigos e finalmente buscar ajuda profissional. Será difícil, mas é algo necessário para me livrar dessa culpa. Afinal, ainda há esperança de que eu possa encontrar paz e forças para seguir em frente.", resultado: .derrota), FinalDialogs(texto: "Essa noite, finalmente pude enfrentar meus medos mais profundos. Os encarei de frente, com coragem e determinação, e descobri uma força interior que eu nem sabia que possuía. Sinto que, enfim, posso me libertar da culpa que me assombrava e encontrar o desfecho que há tanto tempo busco. A jornada não acabou, mas agora sinto que estou no caminho certo. Sei que não preciso lidar com isso sozinha, vou dar ouvido a meus amigos e buscar ajuda profissional. Quem sabe, assim, esse processo seja mais fácil.", resultado: .vitoria)]
