//
//  LetsMakeStars.swift
//  ProjectTwo
//
//  Created by Jessie Albarian on 4/9/16.
//  Copyright © 2016 babyllama. All rights reserved.
//

import UIKit
import SpriteKit

class LetsMakeStars: SKScene {
    
    
    let square = SKSpriteNode(imageNamed: "ministar")
    
    
    override func didMoveToView(view: SKView) {
        ("GameScene2: \(view.frame.size)")
        self.backgroundColor = UIColor(red: 0.1, green: 0.3, blue: 0.1, alpha: 1.0)
    }
    
    
    override func animationDidStart(anim: CAAnimation) {
        let square = SKSpriteNode(imageNamed: "alien1")
        self.addChild(square)
        
        let fadeOut = SKAction.fadeOutWithDuration(0.5)
        let remove = SKAction.removeFromParent()
        
        // Try some other actions...
        
        // 1. wait
        let wait = SKAction.waitForDuration(1.0)
        square.runAction(SKAction.sequence([wait, fadeOut, remove]))
    }
    
    
//    func createStar(){
//        //-----------
//        // SPRITEKIT
//        //-----------
//        
//        let fadeOut = SKAction.fadeOutWithDuration(0.5)
//        let remove = SKAction.removeFromParent()
//        self.addChild(square)
//        square.runAction(SKAction.sequence([fadeOut, remove]))
//    }
    
    
    override func update(currentTime: CFTimeInterval) {
        
    }
}
