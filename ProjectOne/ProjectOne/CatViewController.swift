//
//  DogViewController.swift
//  ProjectOne
//
//  Created by Jessie Albarian on 3/1/16.
//  Copyright © 2016 babyllama. All rights reserved.
//

import UIKit

class CatViewController: UIViewController {
    
    
    var properties = [String]()
    var selectedCat = 0
    var catList = Cat()
    
    

    @IBOutlet var statusLabel: UILabel!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var breedLabel: UILabel!
    @IBOutlet var sexLabel: UILabel!
    @IBOutlet var pedigreeLabel: UILabel!
    @IBOutlet var pic: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    
    override func viewWillAppear(animated: Bool) {
        catList.names =
            Array(catList.catData.keys)
        let chosenCat = catList.names[selectedCat]
        properties = catList.catData[chosenCat]! as [String]
        
        nameLabel.text = chosenCat
        statusLabel.text = properties[0]
        sexLabel.text = properties[2]
        breedLabel.text = properties[3]
        pedigreeLabel.text = properties[4]
        
        if (chosenCat == "Snuggles"){
            pic.image = UIImage(named: "cat1")
        } else if (chosenCat == "Patches"){
            pic.image = UIImage(named: "cat2")
        } else {
            pic.image = UIImage(named: "cat3")
        }
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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
