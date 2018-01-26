//
//  GameScene.swift
//  circle game demo
//
//  Created by matt young on 1/12/18.
//  Copyright © 2018 matt young. All rights reserved.
//

import SpriteKit
import GameplayKit


class levelThree: SKScene, SKPhysicsContactDelegate {
    
    var circle = SKSpriteNode()
    var circle2 = SKSpriteNode()
    var circle3 = SKSpriteNode()
    var circle4 = SKSpriteNode()
    var target  = SKSpriteNode()
    var guy     = SKSpriteNode()
    let guyCategory     :UInt32 = 0x1 << 0
    let targetCategory  :UInt32 = 0x1 << 1
    let circleCategory  :UInt32 = 0x1 << 2
    let circle2Category :UInt32 = 0x1 << 3
    let circle3Category :UInt32 = 0x1 << 4
    let circle4Category :UInt32 = 0x1 << 5
    var levelLabel = SKLabelNode()
    var aLevel = 3
    
    override func didMove(to view: SKView) {
       
      
        gameStart()
        
       
        self.physicsWorld.contactDelegate = self
        
        scene?.anchorPoint = CGPoint(x: 0, y: 0)
        backgroundColor = UIColor.lightGray
        
        levelLabel = SKLabelNode(fontNamed: "Courier New")
        levelLabel.text = "Level:\(aLevel)"
        levelLabel.fontColor = SKColor.green
        levelLabel.fontSize = 70
        levelLabel.position = CGPoint(x: frame.midX, y: 1200)
        self.addChild(levelLabel)
    }
    
        
        
    
    
    
       func gameStart (){
        
       
        
        
        circle = SKSpriteNode(texture: SKTexture(imageNamed: "Circle1"))
        circle.position = CGPoint(x: self.frame.size.width / 2, y: self.frame.size.height / 2)
        circle.physicsBody = SKPhysicsBody(texture: circle.texture!, size: CGSize(width: circle.frame.width, height: circle.frame.height))
        circle.physicsBody?.isDynamic = false
        circle.physicsBody?.allowsRotation = true
        circle.run(SKAction.repeatForever(SKAction.rotate(byAngle: CGFloat.pi * 2.0, duration: 10.0 )), withKey: "rotatecircle")
        self.addChild(circle)
        
        circle2 = SKSpriteNode(texture: SKTexture(imageNamed: "Circle2"))
        circle2.position = CGPoint(x: self.frame.size.width / 2, y: self.frame.size.height / 2)
        circle2.physicsBody = SKPhysicsBody(texture: circle2.texture!, size: CGSize(width: circle2.frame.width, height: circle2.frame.height))
        circle2.physicsBody?.isDynamic = false
        circle2.physicsBody?.allowsRotation = true
        circle2.run(SKAction.repeatForever(SKAction.rotate(byAngle: -CGFloat.pi * 2.0, duration: 10.0)), withKey: "rotatecircle2")
        self.addChild(circle2)
        
        circle3 = SKSpriteNode(texture: SKTexture(imageNamed: "Circle3"))
        circle3.position = CGPoint(x: self.frame.size.width / 2, y: self.frame.size.height / 2)
        circle3.physicsBody = SKPhysicsBody(texture: circle3.texture!, size: CGSize(width: circle3.frame.width, height: circle3.frame.height))
        circle3.physicsBody?.isDynamic = false
        circle3.physicsBody?.allowsRotation = true
        circle3.run(SKAction.repeatForever(SKAction.rotate(byAngle: CGFloat.pi * 2.0, duration: 7.0)), withKey: "rotatecircle3")
        self.addChild(circle3)
        
        circle4 = SKSpriteNode(texture: SKTexture(imageNamed: "Circle4"))
        circle4.position = CGPoint(x: self.frame.size.width / 2, y: self.frame.size.height / 2)
        circle4.physicsBody = SKPhysicsBody(texture: circle4.texture!, size: CGSize(width: circle4.frame.width, height: circle4.frame.height))
        circle4.physicsBody?.isDynamic = false
        circle4.physicsBody?.allowsRotation = true
        circle4.run(SKAction.repeatForever(SKAction.rotate(byAngle: CGFloat.pi * 2.0, duration: 1.75)), withKey: "rotatecircle4")
        self.addChild(circle4)
        
        target = SKSpriteNode(texture: SKTexture(imageNamed: "Target"))
        target.position = CGPoint(x: self.frame.size.width / 2, y: self.frame.size.height / 2)
        target.name = "target"
        target.physicsBody = SKPhysicsBody(texture: target.texture!, size: CGSize(width: target.frame.width, height: target.frame.height))
        target.physicsBody?.isDynamic = false
        target.physicsBody?.affectedByGravity = false
        self.addChild(target)
        
        guy = SKSpriteNode(texture: SKTexture(imageNamed: "Guy"))
        guy.position = CGPoint(x: self.frame.size.width/2 , y:40)
        guy.name = "guy"
        guy.physicsBody = SKPhysicsBody(texture: guy.texture!, size: CGSize(width: guy.frame.width, height: guy.frame.height))
        guy.physicsBody?.isDynamic = false
        guy.physicsBody?.affectedByGravity = false
        self.addChild(guy)
        
        
        circle.physicsBody?.categoryBitMask     = circleCategory
        circle.physicsBody?.collisionBitMask    = targetCategory
        circle.physicsBody?.contactTestBitMask  = targetCategory
        
        circle2.physicsBody?.categoryBitMask    = circle2Category
        circle2.physicsBody?.collisionBitMask   = targetCategory
        circle2.physicsBody?.contactTestBitMask = targetCategory
        
        circle3.physicsBody?.categoryBitMask    = circle3Category
        circle3.physicsBody?.collisionBitMask   = targetCategory
        circle3.physicsBody?.contactTestBitMask = targetCategory
        
        circle4.physicsBody?.categoryBitMask    = circle4Category
        circle4.physicsBody?.collisionBitMask   = targetCategory
        circle4.physicsBody?.contactTestBitMask = targetCategory
        
        target.physicsBody?.categoryBitMask     = targetCategory
        target.physicsBody?.collisionBitMask    = guyCategory
        target.physicsBody?.contactTestBitMask  = guyCategory
        
        guy.physicsBody?.categoryBitMask        = guyCategory
        guy.physicsBody?.collisionBitMask       = targetCategory
        guy.physicsBody?.contactTestBitMask     = targetCategory
        
        
        
        
        
    }
    
    func youWon() {
        //backgroundColor = UIColor.green
       // let levelthree = levelThree(fileNamed: "levelThree")
        //levelthree?.scaleMode = .aspectFill
        //self.view?.presentScene(levelthree!, transition: SKTransition.fade(withDuration: 0.1))
        
        
    }
    
    func youLost() {
        
        removeAllChildren()
        levelLabel = SKLabelNode(fontNamed: "Courier New")
        levelLabel.text = "Level:\(aLevel)"
        levelLabel.fontColor = SKColor.green
        levelLabel.fontSize = 70
        levelLabel.position = CGPoint(x: frame.midX, y: 1200)
        self.addChild(levelLabel)
        gameStart()
        
        
        
    }
    
    
    func didBegin(_ contact: SKPhysicsContact) {
        let collision1:UInt32 = contact.bodyA.categoryBitMask
        
        
        if collision1 == targetCategory {
            youWon()
            
        }
        else {
            
            youLost()
            
            
            
            
            
        }
        
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        guy.physicsBody = SKPhysicsBody(texture: guy.texture!, size: CGSize(width: guy.frame.width, height: guy.frame.height))
        self.physicsWorld.gravity = CGVector(dx: 0 ,dy: 20);
        
        
        
        
    }
    
    
    
    override func update(_ currentTime: TimeInterval) {
        
    }
    
}

