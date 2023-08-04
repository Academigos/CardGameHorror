//
//  Erick.swift
//  CardGameHorror
//
//  Created by Eduardo on 28/07/23.
//

import Foundation
import SpriteKit

class Erick: SKSpriteNode{
    let erick: SKTexture
    
    init(){
        self.erick = SKTexture(imageNamed: "CreditosErick")
        super.init(texture: erick, color: .clear, size: erick.size())
        self.scale(to: autoScale(self, widthProportion: 0.22, screenSize: GameViewController.screenSize))
        isUserInteractionEnabled = true

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
           let alertController = UIAlertController(title: "Leave the game?", message: "Do you want to open the link and leave the game?", preferredStyle: .alert)
           
           let cancelAction = UIAlertAction(title: "No", style: .cancel, handler: nil)
           alertController.addAction(cancelAction)
           
           let openLinkAction = UIAlertAction(title: "Yes", style: .default) { _ in
               if let url = URL(string: "https://www.linkedin.com/in/erickrib/") {
                   UIApplication.shared.open(url, options: [:], completionHandler: nil)
               }
           }
           alertController.addAction(openLinkAction)
           
           // Get the topmost window scene and then the topmost window to present the alert
           if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let topWindow = windowScene.windows.first(where: { $0.isKeyWindow }) {
               topWindow.rootViewController?.present(alertController, animated: true, completion: nil)
           }
       }
}
