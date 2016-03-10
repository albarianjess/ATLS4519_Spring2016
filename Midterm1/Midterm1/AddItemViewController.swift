//
//  AddItemViewController.swift
//  Midterm1
//
//  Created by Jessie Albarian on 3/10/16.
//  Copyright © 2016 babyllama. All rights reserved.
//

import UIKit

class AddItemViewController: UIViewController {

    //----------
    // VARIABLES
    //----------
    var addedItem = String()
    @IBOutlet var addTextField: UITextField!
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender:
        AnyObject?) {
            if segue.identifier == "savesegue"{
                //only add a country if there is text in the textfield
                if ((addTextField.text?.isEmpty) == false){
                    addedItem = addTextField.text!
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
