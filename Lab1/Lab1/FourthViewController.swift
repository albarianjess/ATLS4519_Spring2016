//
//  FourthViewController.swift
//  Lab1
//
//  Created by Jessie Albarian on 1/22/16.
//  Copyright © 2016 babyllama. All rights reserved.
//

import UIKit

class FourthViewController: UIViewController {

    
    // Go to music URL
    @IBAction func gotomusic(sender: AnyObject) {
        if (UIApplication.sharedApplication().canOpenURL(NSURL(string: "pandora://")!)) {
            UIApplication.sharedApplication().openURL(NSURL(string: "pandora://")!)
        } else {
            if (UIApplication.sharedApplication().canOpenURL(NSURL(string: "music://")!)) {
                UIApplication.sharedApplication().openURL(NSURL(string: "music://")!)
            } else {
                UIApplication.sharedApplication().openURL(NSURL(string: "http://www.apple.com/music/")!)
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
