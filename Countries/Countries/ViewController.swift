//
//  ViewController.swift
//  Countries
//
//  Created by Jessie Albarian on 1/28/16.
//  Copyright © 2016 babyllama. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    
    
    var continentList = Continents()
    
    
    //Number of rows in the section
    override func tableView(tableView: UITableView, numberOfRowsInSection
        section: Int) -> Int {
            return continentList.continentData.count
    }
    
    // Displays table view cells
    override func tableView(tableView: UITableView, cellForRowAtIndexPath
        indexPath: NSIndexPath) -> UITableViewCell {
            //configure the cell
            let cell =
            tableView.dequeueReusableCellWithIdentifier("CellIdentifier", forIndexPath:indexPath)
            cell.textLabel?.text = continentList.continents[indexPath.row]
            return cell
    }
    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender:
        AnyObject?) {
            if segue.identifier == "countrySegue" {
                let detailVC = segue.destinationViewController as!DetailTableViewController
                let indexPath = tableView.indexPathForCell(sender as! UITableViewCell)!
                //sets the data for the destination controller
                detailVC.title = continentList.continents[indexPath.row]
                detailVC.continentListDetail=continentList
                detailVC.selectedContinent = indexPath.row
            }
    }
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let path = NSBundle.mainBundle().pathForResource("continents", ofType: "plist")
        continentList.continentData = NSDictionary(contentsOfFile: path!) as! [String : [String]]
        continentList.continents = Array(continentList.continentData.keys)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

