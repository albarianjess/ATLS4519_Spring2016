//
//  DogViewController.swift
//  ProjectOne
//
//  Created by Jessie Albarian on 3/1/16.
//  Copyright © 2016 babyllama. All rights reserved.
//

import UIKit

class SmallViewController: UIViewController {
    
    
    //    var properties = [String]()
    var selectedSmall = 0
    var smallList = Small()
    
//    
//    @IBOutlet weak var nameLabel: UILabel!
//    @IBOutlet weak var statusLabel: UILabel!
//    @IBOutlet weak var breedLabel: UILabel!
//    @IBOutlet weak var sexLabel: UILabel!
//    @IBOutlet weak var pedigreeLabel: UILabel!
//    @IBOutlet weak var pic: UIImageView!
//    @IBOutlet var ageLabel: UILabel!
    
    @IBOutlet var pic: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var ageLabe: UILabel!
    @IBOutlet var sexLabel: UILabel!
    @IBOutlet var breedLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    
    override func viewWillAppear(animated: Bool) {
        let chosenDog = smallList.nameList[selectedSmall]
        
        // Set label information
        nameLabel.text = "Name: " + chosenDog
        breedLabel.text = "Breed: " + smallList.breedList[selectedSmall]
        sexLabel.text = "Sex: " + smallList.sexList[selectedSmall]
        ageLabe.text = "Age: " + smallList.ageList[selectedSmall]
        
        // Decode base64 to use as image
        let plainString = smallList.picList[selectedSmall]
        let decodedData = NSData(base64EncodedString: plainString, options: NSDataBase64DecodingOptions(rawValue: 0))
        let decodedimage = UIImage(data: decodedData!)
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
