//
//  DogViewController.swift
//  ProjectOne
//
//  Created by Jessie Albarian on 3/1/16.
//  Copyright © 2016 babyllama. All rights reserved.
//

import UIKit

class DogViewController: UIViewController {

    
    var properties = [String]()
    var selectedDog = 0
    var dogList = Dog()
    
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var breedLabel: UILabel!
    @IBOutlet weak var sexLabel: UILabel!
    @IBOutlet weak var pedigreeLabel: UILabel!
    @IBOutlet weak var pic: UIImageView!
    @IBOutlet var ageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    
    override func viewWillAppear(animated: Bool) {
//        dogList.names = Array(dogList.dogData.keys)
//        let chosenDog = dogList.names[selectedDog]
//        
//        properties = dogList.dogData[chosenDog]! as [String]
        
//        nameLabel.text = chosenDog
//        statusLabel.text = properties[0]
//        sexLabel.text = properties[2]
//        breedLabel.text = properties[3]
//        pedigreeLabel.text = properties[4]
        
//        if (chosenDog == "Moose"){
//            pic.image = UIImage(named: "dog1")
//        } else if (chosenDog == "Blanco"){
//            pic.image = UIImage(named: "dog2")
//        } else {
//            pic.image = UIImage(named: "dog3")
//        }
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
