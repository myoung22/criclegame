//
//  GameViewController.swift
//  circle game demo 2
//
//  Created by matt young on 1/17/18.
//  Copyright © 2018 matt young. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {
     let defaults = UserDefaults.standard
    override func viewDidLoad() {
        super.viewDidLoad()
        var initialLevel = "levelOne"
        
        if defaults.object(forKey: "continuePoint") != nil{
            print("hello")
            initialLevel = defaults.string(forKey: "continuePoint")!
            print("hello")
        }

        
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            if let scene = GameScene(fileNamed: initialLevel) {
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFill
                
               currentLevel = initialLevel
                
                view.presentScene(scene)
            }
            
            view.ignoresSiblingOrder = true
            
            view.showsFPS = true
            view.showsNodeCount = true
        }
    }

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
