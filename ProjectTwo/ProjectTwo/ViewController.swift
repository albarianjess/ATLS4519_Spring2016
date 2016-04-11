//
//  ViewController.swift
//  ProjectTwo
//
//  Created by Jessie Albarian on 4/9/16.
//  Copyright © 2016 babyllama. All rights reserved.
//

import UIKit
import Firebase
import SpriteKit


class ViewController: UIViewController {

    
    // SOURCES: http://mathewsanders.com/animations-in-swift-part-two
    
    
    func stars(){
        var count = 0
        
        repeat {
            let staysquares = UIView()
            let x = Int(arc4random_uniform(700))
            let y = Int(arc4random_uniform(700))
            staysquares.frame = CGRect(x: x, y: y, width: 6, height: 6)
            staysquares.backgroundColor = UIColor.whiteColor()
            self.view.layer.zPosition = -100
//            self.view.bringSubviewToFront(staysquares)
            self.view.addSubview(staysquares)
            count += 1
        } while count < 30
        

        
        
        
//        count = 0
//        repeat {
//            let square = UIView()
//            let num1 = Int(arc4random_uniform(700))
//            let num2 = Int(arc4random_uniform(700))
//        
//            square.frame = CGRect(x: num1, y: num2, width: 6, height: 6)
//            square.backgroundColor = UIColor.whiteColor()
//            self.view.addSubview(square)
//            let viewsToAnimate = [square]
//            count += 1
        
            //------------
            // ANIMATIONS
            //------------
//            UIView.animateWithDuration(0.5, delay: 2, options: .Repeat, animations: {
//                UIView.performSystemAnimation(UISystemAnimation.Delete, onViews: viewsToAnimate, options: .Repeat, animations: {
//                            }, completion: { finished in })
//                }, completion: { finished in })
            
//            
//            UIView.performSystemAnimation(UISystemAnimation.Delete, onViews: viewsToAnimate, options: .Repeat, animations: {
//                
//                
//                UIView.animateWithDuration(20, delay: 2, options: .Repeat, animations: {
//                }, completion: { finished in })
//                }, completion: { finished in })
//            
            
            
            
            
//            } while count < 20

    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController!.navigationBar.barTintColor = UIColor(red: 4.0/255.0, green: 4.0/255.0, blue: 48.0/255.0, alpha: 1.0)
//        navigationController!.navigationBar.tintColor = UIColor.whiteColor()
        UINavigationBar.appearance().tintColor = UIColor.whiteColor()
        
        
//        let frame = UIScreen.mainScreen().applicationFrame
//        let frame = UIScreen.mainScreen().bounds
//        let w = frame.width //* scale
//        let h = frame.height //* scale
//        let scene = LetsMakeStars(size: CGSize(width: w, height: h))
//        
//        // Configure the view.
////        let skView = self.UIView as! SKView
//        let skView = view as! SKView
//        skView.showsFPS = true
//        skView.showsNodeCount = true
//        
//        /* Sprite Kit applies additional optimizations to improve rendering performance */
//        skView.ignoresSiblingOrder = true
//        
//        /* Set the scale mode to scale to fit the window */
//        scene.scaleMode = .AspectFill
//        
//        skView.presentScene(scene)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

