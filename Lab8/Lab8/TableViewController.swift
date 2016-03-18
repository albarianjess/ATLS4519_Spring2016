//
//  TableViewController.swift
//  Lab8
//
//  Created by Jessie Albarian on 3/17/16.
//  Copyright © 2016 jessie. All rights reserved.
//

import UIKit
import Firebase



class TableViewController: UITableViewController {

    let ref = Firebase(url: "https://crackling-fire-9004.firebaseio.com")
    var places = [Places]()
    
    
    @IBAction func unwindSegue(segue:UIStoryboardSegue){
        if segue.identifier == "savesegue" {
            let source = segue.sourceViewController as! ViewController
            if source.addedLat.isEmpty == false {
                let newPlace = Places(newlat: source.addedLat, newlong: source.addedLong)
                places.append(newPlace)
                //create Dictionary
                let newPlaceDict = ["latitude": source.addedLat, "longitude": source.addedLong]
                let placeref = ref.childByAppendingPath(source.addedLat)
                //write data to Firebase
                placeref.setValue(newPlaceDict)
            }
        }
    }
    
    
    override func viewDidAppear(animated: Bool) {
        
        super.viewDidAppear(animated)
        ref.observeEventType(FEventType.Value, withBlock: {snapshot in self.places=[]

            if let snapshots = snapshot.children.allObjects as?
                [FDataSnapshot]{
                    for item in snapshots {
                        guard let latitude = item.value["latitude"] as? String,
                            let longitude = item.value["longitude"] as? String
                            else {
                                continue
                        }
                        print(latitude)
                        //create new recipe object
                        let newPlace = Places(newlat: latitude, newlong: longitude)
                        self.places.append(newPlace)
                    }
            }
            self.tableView.reloadData()
        })
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
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
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)

        // Configure the cell...
        let place = places[indexPath.row]
        
        cell.textLabel!.text = place.latitude
//        cell.textLabel!.text = "hi"
        return cell
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
