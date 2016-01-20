//
//  ThirdViewController.swift
//  Lab1
//
//  Created by Jessie Albarian on 1/19/16.
//  Copyright © 2016 babyllama. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    
    @IBOutlet weak var choiceLabel: UILabel!
    @IBOutlet weak var beerPicker: UIPickerView!
    let beerComponent = 0
    let breweryComponent = 1
    
    
    var pairing : [String: [String]]!
    var beer : [String]!
    var brewery : [String]!
    
    //Required for the UIPickerViewDataSource protocol
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent
        component: Int) -> Int {
            if component == beerComponent {
                return beer.count
            } else {
                return brewery.count
            }
    }

    //Returns the title for a given row
    func pickerView(pickerView: UIPickerView, titleForRow row: Int,
        forComponent component: Int) -> String? {
            if component == beerComponent {
                return beer[row]
            }
            else {
                return brewery[row]
            }
    }
    //Called when a row is selected
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int,
        inComponent component: Int) {
            //checks which component was picked
            if component == beerComponent {
                let selectedBeer = beer[row]
                brewery = pairing[selectedBeer]
                beerPicker.reloadComponent(breweryComponent)
                beerPicker.selectRow(0, inComponent: breweryComponent, animated:
                    true)
            }
            let beerrow = pickerView.selectedRowInComponent(beerComponent)
            //gets the selected row for the artist
            let breweryrow = pickerView.selectedRowInComponent(breweryComponent)
            choiceLabel.text = "You like \(beer[beerrow]) from \(brewery[breweryrow])"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let path = NSBundle.mainBundle().pathForResource("pairing",
            ofType: "plist")
        // use NSDictionary to load the plist and cast to a Dictionary
        pairing = NSDictionary(contentsOfFile: path!) as!
            [String:[String]]
        // asign all the Dictionary keys in the artists array
        beer = Array(pairing.keys)
        // assign all the albums for the first artist in the albums array
        brewery = pairing[beer[0]]! as [String]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
