import SpriteKit

enum TextBoxType: Int {
    case cayla
    case cartomante
}

struct TextBoxContent {
    let title: String
    let content: String
}

let dialogo: [TextBoxContent] = [
    TextBoxContent(title: "Cartomante", content: "Bem-vinda, querida. Sinto que você carrega um fardo pesado em seu coração, acredito que busque uma forma de aliviar esse peso, certo? Bem, como posso chamá-la?"),
    TextBoxContent(title: "Cayla", content: "Olá... Meu nome é Cayla. Ouvi falar sobre suas habilidades em trazer clareza às pessoas, e, bem... estou aqui justamente por isso."),
    TextBoxContent(title: "Cayla", content: "Há cinco anos, eu perdi meus pais em um acidente de carro terrível, causado por um motorista alcoolizado, mas que eu poderia ter evitado. Desde então, venho tendo pesadelos sobre o acidente, e é como se cada dia fosse uma batalha contra a culpa e a dor."),
    TextBoxContent(title: "Cartomante", content: "Lamento pela sua perda, Cayla. Perder aqueles que amamos em circunstâncias tão traumáticas deixa uma marca profunda em nossa alma. "),
    TextBoxContent(title: "Cartomante", content: "Posso te ajudar a deixar essa culpa ir, mas antes de prosseguirmos, saiba que você não tem culpa pelos atos irresponsáveis de outra pessoa. Sua decisão de dirigir naquela noite foi tomada com responsabilidade, e você não poderia prever o comportamento do outro motorista."),
    TextBoxContent(title: "Cartomante", content: " Bem, que tal vermos que orientação e clareza as cartas têm para você? Elas podem te mostrar o caminho para encontrar forças e seguir em frente."),
    TextBoxContent(title: "Cayla", content: "Claro. Eu estou disposta a tentar qualquer coisa que possa me ajudar a superar essa culpa e seguir adiante com minha vida."),
    TextBoxContent(title: "Cartomante", content: "Muito bem, Cayla. Antes de revelar as cartas, saiba que as cartas têm um poder intuitivo, mas apenas revelam possibilidades e influências. O verdadeiro poder está em você, e em como escolhe lidar com o que é revelado."),
    TextBoxContent(title: "Cartomante", content: "Agora, vamos iniciar a leitura \"Caminho Através de Adversidade\"."),
    TextBoxContent(title: "Cartomante", content: "A primeira carta representa suas metas. Aqui temos a carta da Força. Significa que você é capaz de superar o que te traz tanta dor, Cayla. Mesmo diante de lutas intensas, você tem a capacidade de se manter calma e forte, basta restaurar essa sua força."),
    TextBoxContent(title: "Cartomante", content: "A segunda carta representa a adversidade. Aqui temos o Carro invertido. Isso indica que pode haver uma falta de foco, motivação ou direção em sua jornada. O Carro também é um lembrete de que você pode alcançar a vitória, desde que tenha coragem aceitar que nem sempre estaremos no controle."),
    TextBoxContent(title: "Cartomante", content: " Por fim, a terceira carta representa em que você precisa focar para superar seus obstáculos. Aqui temos o Enforcado. Essa carta comunica que às vezes, precisamos abrir mão de antigas visões para encontrarmos um novo sentido em nossa jornada."),
    TextBoxContent(title: "Cartomante", content: "Essas são as mensagens que as cartas têm para você, querida. Lembre-se, Cayla, superar a culpa e seguir em frente não significa esquecer suas memórias ou seus pais. É sobre encontrar paz e perdão dentro de si mesma, liberando-se da culpa que não lhe pertence."),
    TextBoxContent(title: "Cartomante", content: "O caminho pode ser desafiador, mas você tem uma força interior notável, e nunca estará sozinha."),
    TextBoxContent(title: "Cayla", content: "Muito obrigada… Ainda parece difícil, mas agora sinto que tenho um novo ponto de partida para minha jornada de cura."),
    TextBoxContent(title: "Cartomante", content: "Estou feliz em poder ajudar, Cayla. Estarei torcendo por seu sucesso nessa jornada, seja forte. Adeus.")
]

class TextBox: SKSpriteNode {
    let textBoxType: TextBoxType
    let textBoxTexture: SKTexture
    private var currentTextContentIndex = 0
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("NSCoding not supported")
    }
    
    init(textBoxType: TextBoxType) {
        self.textBoxType = textBoxType
        
        switch textBoxType {
        case .cayla:
            textBoxTexture = SKTexture(imageNamed: "textbox_cayla")
        case .cartomante:
            textBoxTexture = SKTexture(imageNamed: "textbox_cartomante")
        }
        
        super.init(texture: textBoxTexture, color: UIColor.clear, size: textBoxTexture.size())
        self.position = CGPoint(x: GameViewController.screenSize.width * 0.5, y: GameViewController.screenSize.height * 0.305)
        self.scale(to: autoScale(self, widthProportion: 0.909, screenSize: GameViewController.screenSize))
        zPosition = 2
    }
    
    func addTextContent(_ textContent: TextBoxContent) {
        removeAllTextContent() // Remover o conteúdo anterior
        
        let titleTextLabel = TextContent(title: textContent.title, content: "")
        titleTextLabel.preferredMaxLayoutWidth = size.width * 0.71
        titleTextLabel.position = CGPoint(x: 0, y: size.height * 0.25) // Ajuste a posição do título
        addChild(titleTextLabel)
        
        let contentTextLabel = TextContent(title: "", content: textContent.content)
        contentTextLabel.preferredMaxLayoutWidth = size.width * 0.71
        contentTextLabel.position = CGPoint(x: 0, y: -size.height * 0.09)
        addChild(contentTextLabel)
    }
    
    private func removeAllTextContent() {
        for node in children {
            if let textLabel = node as? TextContent {
                textLabel.removeFromParent()
            }
        }
    }
    
    // Função para percorrer o array dialogo
    func playDialog() {
        var delay: TimeInterval = 0
        
        for content in dialogo {
            let waitAction = SKAction.wait(forDuration: delay)
            let addContentAction = SKAction.run {
                self.addTextContent(content)
            }
            let sequence = SKAction.sequence([waitAction, addContentAction])
            run(sequence)
            
            // Aumentar o atraso para a próxima caixa de diálogo
            delay += 8.0
        }
    }
}

class TextContent: SKLabelNode {
    let title: String
    let content: String

    required init?(coder aDecoder: NSCoder) {
        fatalError("NSCoding not supported")
    }

    init(title: String, content: String) {
        self.title = title
        self.content = content

        super.init()
        setupText()
    }

    private func setupText() {
        fontName = "BreeSerif-Regular"
        text = "\(title)\n\(content)" // Título e conteúdo na mesma linha
        fontSize = 17
        numberOfLines = 4
        zPosition = 4
        verticalAlignmentMode = .center
        lineBreakMode = .byWordWrapping
        fontColor = .black
        preferredMaxLayoutWidth = 200
    }
}
