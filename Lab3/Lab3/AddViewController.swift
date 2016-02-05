//
//  AddViewController.swift
//  Lab3
//
//  Created by Jessie Albarian on 2/5/16.
//  Copyright © 2016 babyllama. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {

    
    
    @IBOutlet weak var addBuilding: UITextField!
    var addedBuilding = String()
    
    
    
    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
            if segue.identifier == "doneSegue"{
                //only add a country if there is text in the textfield
                if ((addBuilding.text?.isEmpty) == false){
                    addedBuilding = addBuilding.text!
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
