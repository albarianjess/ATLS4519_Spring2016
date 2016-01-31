//
//  ViewController.swift
//  Countries
//
//  Created by Jessie Albarian on 1/28/16.
//  Copyright © 2016 babyllama. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    
    
    var placesList = CUBoulder()
    
    //Number of rows in the section
    override func tableView(tableView: UITableView, numberOfRowsInSection
        section: Int) -> Int {
            return placesList.placesData.count
    }
    
    // Displays table view cells
    override func tableView(tableView: UITableView, cellForRowAtIndexPath
        indexPath: NSIndexPath) -> UITableViewCell {
            //configure the cell
            let cell =
            tableView.dequeueReusableCellWithIdentifier("CellIdentifier", forIndexPath:
                indexPath)
            cell.textLabel?.text = placesList.places[indexPath.row]
            return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let path = NSBundle.mainBundle().pathForResource("continents", ofType: "plist")
        placesList.placesData = NSDictionary(contentsOfFile: path!)
            as! [String : [String]]
        placesList.places = Array(placesList.placesData.keys)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

