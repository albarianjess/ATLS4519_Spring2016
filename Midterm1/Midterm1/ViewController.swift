//
//  ViewController.swift
//  Midterm1
//
//  Created by Jessie Albarian on 3/10/16.
//  Copyright © 2016 babyllama. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    var storeList = Stores()
    
    
    
    
    
    //---------------------------
    // NUMBER OF ROWS IN SECTION
    //---------------------------
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return storeList.storesData.count
    }
    
    
    
    //-------------------
    // DISPLAY TABLE VIEW
    //-------------------
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCellWithIdentifier("CellIdentifier", forIndexPath: indexPath)
        cell.textLabel?.text = storeList.items[indexPath.row]
        cell.textLabel?.font = UIFont(name: "HelveticaNeue", size: 28)
        cell.textLabel?.textAlignment = .Center
        
            return cell
    }
    
    
    
    //-------------------
    // PREPARE FOR SEGUE
    //-------------------
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "itemsegue" {
            let detail = segue.destinationViewController as! ItemsViewController
            let indexPath = tableView.indexPathForCell(sender as! UITableViewCell)
            detail.title = storeList.items[indexPath!.row]
            detail.storeListItem = storeList
            detail.selectedStore = indexPath!.row

        }
    }
    
    
    
    //--------------
    // VIEW DID LOAD
    //--------------
    override func viewDidLoad() {
        super.viewDidLoad()
        let path = NSBundle.mainBundle().pathForResource("stores", ofType: "plist")
        storeList.storesData = NSDictionary(contentsOfFile: path!) as! [String : [String]]
        storeList.items = Array(storeList.storesData.keys)
        
        // Change background
        tableView.backgroundView = UIImageView(image: UIImage(named: "grocery"))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

