//
//  GameViewController.swift
//  CardGameHorror
//
//  Created by Eduardo on 10/07/23.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {
    static var screenSize = CGSize()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        GameViewController.screenSize = view.bounds.size
        //MARK: -Battle Scene
        // get Scene
        let battleScene = BattleScene(size: GameViewController.screenSize)
        // Set the scale mode to scale to fit the window
        battleScene.scaleMode = .aspectFill
        
        // Present the scene
        if let view = self.view as! SKView? {
            view.presentScene(battleScene)
            
            view.ignoresSiblingOrder = true
            view.showsFPS = true
            view.showsNodeCount = true
        }
    }
    
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}
