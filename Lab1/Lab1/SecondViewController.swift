//
//  SecondViewController.swift
//  Lab1
//
//  Created by Jessie Albarian on 1/19/16.
//  Copyright © 2016 babyllama. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    // Variables
    @IBOutlet weak var foodPicker: UIPickerView!
    @IBOutlet weak var choiceLabel: UILabel!
    
    //PickerView data
    let spicy = ["Spicy", "Not Spicy"]
    let type = ["Italian", "Mexican", "Asian", "American"]
    
    
    // Number of components in pickerView
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 2
    }
    
    // Number of rows for pickerView
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return spicy.count
        } else {
            return type.count
        }
    }
    
    
    // Title for section
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return spicy[row]
        } else {
            return type[row]
        }
    }
    
    
    // PickerView selection
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        let spicyRow = pickerView.selectedRowInComponent(0)
        let typeRow = pickerView.selectedRowInComponent(1)
        choiceLabel.text = "You like \(spicy[spicyRow]), \(type[typeRow) food!"
        
        // Image Change
        if (type[typeRow] == "Italian") {
            // add italian pic
//            winePic.image=UIImage(named: "redWine")
        } else if (type[typeRow] == "Mexican") {
            // add mexican pic
//            winePic.image=UIImage(named: "redWine")
        } else if (type[typeRow] == "Asian") {
            // add asian pic
//            winePic.image=UIImage(named: "redWine")
        } else {
            // add american pic
//            winePic.image=UIImage(named: "redWine")
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

