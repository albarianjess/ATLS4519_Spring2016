//
//  FirstViewController.swift
//  Lab1
//
//  Created by Jessie Albarian on 1/19/16.
//  Copyright © 2016 babyllama. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    // Variables //
    @IBOutlet weak var choiceLabel: UILabel!
    @IBOutlet weak var winePic: UIImageView!
    @IBOutlet weak var winePicker: UIPickerView!


    //PickerView data
    let wine = ["Red", "White"]
    let dry = ["Dry", "Off-dry", "Sweet"]
    let aroma = ["Fruity", "Vanilla", "Earthy"]
    
    
    // Number of components in pickerView
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 3
    }
    
    // Number of rows for pickerView
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return wine.count
        } else if component == 1 {
            return dry.count
        } else {
            return aroma.count
        }
    }
    
    
    // Title for section
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return wine[row]
        } else if component == 1 {
            return dry[row]
        } else {
            return aroma[row]
        }
    }
    
    
    // PickerView selection
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        let wineRow = pickerView.selectedRowInComponent(0)
        let dryRow = pickerView.selectedRowInComponent(1)
        let aromaRow = pickerView.selectedRowInComponent(2)
        choiceLabel.text = "You like \(dry[dryRow]), \(aroma[aromaRow), \(wine[wineRow])!"
        
//        // Image Change
//        if (wine[wineRow] == "Red") {
//            // add red wine pic
//            winePic.image=UIImage(named: "redWine")
//        } else {
//            winePic.image=UIImage(named: "whiteWine")
//        }
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

