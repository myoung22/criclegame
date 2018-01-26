//
//  GameScene.swift
//  circle game demo 2
//
//  Created by matt young on 1/17/18.
//  Copyright © 2018 matt young. All rights reserved.
//

import SpriteKit
import GameplayKit
///import UIKit



var welcomeLabel = SKLabelNode()
var playLabel = SKLabelNode()
var currentLevel = ""

class GameScene: SKScene {
    
    let defaults = UserDefaults.standard
    
    override func didMove(to view: SKView) {
        
        defaults.set(currentLevel, forKey: "continuePoint")

        
        welcomeLabel = SKLabelNode(fontNamed: "Courier New")
        welcomeLabel.text = "Go round Go"
        welcomeLabel.fontColor = SKColor.green
        welcomeLabel.fontSize = 50
        welcomeLabel.position = CGPoint(x: frame.midX, y: 500)
        addChild(welcomeLabel)

        
        backgroundColor = UIColor.lightGray
        
        
        playLabel = SKLabelNode(fontNamed: "Courier New")
        playLabel.text = "Tap anywhere to play"
        playLabel.fontColor = SKColor.green
        playLabel.fontSize = 50
        playLabel.position = CGPoint(x: frame.midX, y: frame.midY)
        addChild(playLabel)

        
        
        
    }
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        welcomeLabel.isHidden = true
        playLabel.isHidden = true
        let nextlevel = levelOne(fileNamed: "levelOne")
        nextlevel?.scaleMode = .aspectFill
        self.view?.presentScene(nextlevel!, transition: SKTransition.fade(withDuration: 0.1))
        
        
        
        }
    
    
    override func update(_ currentTime: TimeInterval) {
        
        
        
    }
}
