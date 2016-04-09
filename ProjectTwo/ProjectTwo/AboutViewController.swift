//
//  AboutViewController.swift
//  ProjectTwo
//
//  Created by Jessie Albarian on 4/9/16.
//  Copyright © 2016 babyllama. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {

    
    
    
    func stars(){
        var count = 0
        
        repeat {
            let staysquares = UIView()
            let x = Int(arc4random_uniform(700))
            let y = Int(arc4random_uniform(700))
            staysquares.frame = CGRect(x: x, y: y, width: 6, height: 6)
            staysquares.backgroundColor = UIColor.whiteColor()
//            self.view.layer.zPosition = 100
            //            self.view.bringSubviewToFront(staysquares)
            self.view.addSubview(staysquares)
            count += 1
        } while count < 30
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        stars()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
