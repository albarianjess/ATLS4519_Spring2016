//
//  InfoViewController.swift
//  Lab3
//
//  Created by Jessie Albarian on 2/5/16.
//  Copyright © 2016 babyllama. All rights reserved.
//

import UIKit

class InfoViewController: UITableViewController {

    
    
    @IBOutlet weak var placesColumn: UILabel!
    
    @IBOutlet weak var numberColumn: UILabel!
    
    var name = String()
    var number = String()
    
    
    
    override func viewWillAppear(animated: Bool) {
        placesColumn.text = name
        numberColumn.text = number
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
