//
//  ViewController.swift
//  Lab8
//
//  Created by Jessie Albarian on 3/17/16.
//  Copyright © 2016 jessie. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    var addedLat = Double()
    var addedLong = Double()
    var addedName = String()
    
    @IBOutlet var buildingText: UITextField!
    @IBOutlet var latText: UITextField!
    @IBOutlet var longText: UITextField!
    
    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
            if segue.identifier == "savesegue"{
                if buildingText.text?.isEmpty == false {
                    addedLat = (latText.text! as NSString).doubleValue
                    addedLong = (longText.text! as NSString).doubleValue
                    addedName = buildingText.text!
                }
            }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

