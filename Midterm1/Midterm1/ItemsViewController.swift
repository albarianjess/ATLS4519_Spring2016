//
//  ItemsViewController.swift
//  Midterm1
//
//  Created by Jessie Albarian on 3/10/16.
//  Copyright © 2016 babyllama. All rights reserved.
//

import UIKit

class ItemsViewController: UITableViewController {

    //-----------
    // VARIABLES
    //-----------
    var items = [String]()
    var selectedStore = 0
    var storeListItem = Stores()
    
    
    
    //-----------------
    // VIEW WILL APPEAR
    //-----------------
    override func viewWillAppear(animated: Bool) { storeListItem.items =
            Array(storeListItem.storesData.keys)
        let chosenStore = storeListItem.items[selectedStore]
        items = storeListItem.storesData[chosenStore]! as [String]
    }
    
    
    
    //-----------------------------
    // UNWIND SEGUE FOR ADD
    //-----------------------------
    @IBAction func unwindSegue (segue:UIStoryboardSegue){
        if segue.identifier == "savesegue" {
            let source = segue.sourceViewController as! AddItemViewController
            if ((source.addedItem.isEmpty) == false){
                items.append(source.addedItem)
                tableView.reloadData()
                let chosenStore = storeListItem.items[selectedStore]
                storeListItem.storesData[chosenStore]?.append(source.addedItem)
            }
        }
    }

    
    
    
    
    //--------------
    // VIEW DID LOAD
    //--------------
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

         self.navigationItem.leftBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    //---------------
    // # OF SECTIONS
    //---------------
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    
    //----------
    // # OF ROWS
    //----------
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    
    //---------------
    // CONFIGURE CELL
    //---------------
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("CellIdentifier", forIndexPath: indexPath)
        // Configure the cell
        cell.textLabel?.text = items[indexPath.row]
        cell.textLabel?.font = UIFont(name: "HelveticaNeue", size: 28)
        cell.textLabel?.textAlignment = .Center
        

        return cell
    }

    
    
    //------------------------
    // ALLOWS EDITING OF ROWS
    //------------------------
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            items.removeAtIndex(indexPath.row)
            let chosenStore = storeListItem.items[selectedStore]
            storeListItem.storesData[chosenStore]?.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }


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
