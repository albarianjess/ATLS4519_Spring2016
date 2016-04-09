//
//  ViewController.swift
//  ProjectTwo
//
//  Created by Jessie Albarian on 4/9/16.
//  Copyright © 2016 babyllama. All rights reserved.
//

import UIKit
import Firebase


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
            self.view.layer.zPosition = 100
//            self.view.bringSubviewToFront(staysquares)
            self.view.addSubview(staysquares)
            count += 1
        } while count < 30
        
        repeat {
            let square = UIView()
            let num1 = Int(arc4random_uniform(700))
            let num2 = Int(arc4random_uniform(700))
        
            square.frame = CGRect(x: num1, y: num2, width: 6, height: 6)
            square.backgroundColor = UIColor.whiteColor()
        
            self.view.addSubview(square)
            let viewsToAnimate = [square]
            count += 1
            
            UIView.animateWithDuration(2, delay: 2, options: .Repeat, animations: {
                UIView.performSystemAnimation(UISystemAnimation.Delete, onViews: viewsToAnimate, options: .Repeat, animations: {
                            }, completion: { finished in })
                }, completion: { finished in })
            } while count < 20

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UINavigationBar.appearance().barTintColor = UIColor(red: 46.0/255.0, green: 14.0/255.0, blue: 74.0/255.0, alpha: 1.0)
            stars()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

