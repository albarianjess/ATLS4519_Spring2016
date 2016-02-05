//
//  DetailViewController.swift
//  Lab3
//
//  Created by Jessie Albarian on 2/5/16.
//  Copyright © 2016 babyllama. All rights reserved.
//

import UIKit

class DetailsViewController: UITableViewController {
    
    //Variables
    var places = [String]()
    var selectedPlace = 0
    var placesDetail = Places()
    
    
    
    
    
    
    //Loads every time view shows: sets up table based on selection
    override func viewWillAppear(animated: Bool) {
        placesDetail.places = Array(placesDetail.placesData.keys)
        let chosenPlace = placesDetail.places[selectedPlace]
        places = placesDetail.placesData[chosenPlace]! as [String]
    }
    
    
    //Unwind Segue for adding items
    @IBAction func unwindSegue(segue:UIStoryboardSegue){
        if segue.identifier=="doneSegue"{
            let source = segue.sourceViewController as! AddViewController
            if ((source.addedBuilding.isEmpty) == false){
                places.append(source.addedBuilding)
                tableView.reloadData()
                let chosenBuilding = placesDetail.places[selectedPlace]
                placesDetail.placesData[chosenBuilding]?.append(source.addedBuilding)
            }
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        //         self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return places.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("CellIdentifier", forIndexPath: indexPath)
        
        // Configure the cell...
        cell.textLabel?.text = places[indexPath.row]
        return cell
    }
    
    
    
    
    
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    
    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            //Delete the place from the array
            places.removeAtIndex(indexPath.row)
            let chosenPlace = placesDetail.places[selectedPlace]
            
            //Delete from the data model
            placesDetail.placesData[chosenPlace]?.removeAtIndex(indexPath.row)
            
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    
    
    
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
        let fromRow = fromIndexPath.row //row being moved from
        let toRow = toIndexPath.row //row being moved to
        let movePlace = places[fromRow] //place being moved
        
        //move in array
        places.removeAtIndex(fromRow)
        places.insert(movePlace, atIndex: toRow)
        
        //move in data model
        let chosenPlace = placesDetail.places[selectedPlace]
        placesDetail.placesData[chosenPlace]?.removeAtIndex(fromRow)
        placesDetail.placesData[chosenPlace]?.insert(movePlace, atIndex: toRow)
    }
    
    
    
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
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
