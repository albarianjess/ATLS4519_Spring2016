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
        let chosenDog = dogList.nameList[selectedDog]
        
        // Set label information
        nameLabel.text = "Name: " + chosenDog
        statusLabel.text = "Status: " + dogList.statusList[selectedDog]
        breedLabel.text = "Breed: " + dogList.breedList[selectedDog]
        pedigreeLabel.text = "Pedigree: " + dogList.pedigreeList[selectedDog]
        sexLabel.text = "Sex: " + dogList.sexList[selectedDog]
        ageLabel.text = "Age: " + dogList.ageList[selectedDog]
        
        // Decode base64 to use as image
        let plainString = dogList.picList[selectedDog]
        let decodedData = NSData(base64EncodedString: plainString, options: NSDataBase64DecodingOptions(rawValue: 0))
        let decodedimage = UIImage(data: decodedData!)
        print(decodedimage)
        pic.image = decodedimage! as UIImage
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
