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
    // static to get accesse of screen size
    static var screenSize = CGSize()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //get screen size in var
        GameViewController.screenSize = view.bounds.size
        //MARK: -Battle Scene
        // get Scene
        let gameScene = MainMenuScene(size: GameViewController.screenSize)

        // Set the scale mode to scale to fit the window
            gameScene.scaleMode = .aspectFill
        
        // Present the scene
        if let view = self.view as! SKView? {
            view.presentScene(gameScene)
            view.ignoresSiblingOrder = true
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
