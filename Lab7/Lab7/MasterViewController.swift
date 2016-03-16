//
//  MasterViewController.swift
//  Lab7
//
//  Created by Jessie Albarian on 3/15/16.
//  Copyright © 2016 littlebird. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {

    var detailViewController: DetailViewController? = nil
//    var objects = [AnyObject]()
    var objects = [[String:String]]()
    var numbers = [[String:String]]()
    
    
    
    //--------------------
    // PREPARE FOR SEGUE
    //--------------------
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?){
        if segue.identifier == "showDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let condition = objects[indexPath.row]
                let num = numbers[indexPath.row]
                let title = condition["item"]
                let patients = num["item"]
                let controller = (segue.destinationViewController as!
                    UINavigationController).topViewController as! DetailViewController
                controller.detailItem = patients
                controller.title = title
                controller.navigationItem.leftBarButtonItem =
                    self.splitViewController?.displayModeButtonItem()
                controller.navigationItem.leftItemsSupplementBackButton =
                true
            }
        }
    }
    
    
    
    
    
    
    //-----------
    // LOAD JSON
    //-----------
    func loadjson() {
        let urlPath = "https://data.colorado.gov/api/views/5yqk-p422/rows.json?accessType=DOWNLOAD"
        guard let url = NSURL(string: urlPath)
            else {
                print("url error")
                return
            }
        let session = NSURLSession.sharedSession().dataTaskWithURL(url, completionHandler: {(data, response, error) in
            let httpResponse = response as! NSHTTPURLResponse
            let statusCode = httpResponse.statusCode
            guard statusCode == 200
                else {
                    print("file download error")
                    return
                }
            //download successful
            print("download successful")
            
            dispatch_async(dispatch_get_main_queue()) {
                self.parsejson(data!)
            }
        })
        //must call resume to run session
        session.resume()
    }
    
    
    
    //-----------------
    // PARSE JSON DATA
    //-----------------
    func parsejson(data: NSData){
        do {
            // get json data
            let json = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments) as! NSDictionary

            let meta = json["meta"] as! NSDictionary
            let view = meta.objectForKey("view") as! NSDictionary
            let columns = view.objectForKey("columns") as! [AnyObject]
            
            var hits = 0
            for item in columns {
//                let data = item as! NSDictionary
                let data = item as! [String: AnyObject]
                //print(data.keys)
                
                
                if let cachedContents = data["cachedContents"]{
                    let top = cachedContents.objectForKey("top") as! [AnyObject]
                    for result in top{
                        //let count =
                        let count = String(result["count"]! as! Int)
                        let obj = ["count": count, "item": (result["item"]! as! String)]
//                        print(condition)
                        if hits == 0 {
                            self.objects.append(obj)
                        } else if hits == 1 {
                            self.numbers.append(obj)
                        }
                    }
                    hits++
                    if (hits >= 2){
                        break
                    }
//                    for result in top {
//
//                        guard let id = result["count"]! as? String,
//                        let condition = result["item"]! as? String
//                            else {
//                                continue
//                        }
//                        
//                        let obj = ["id": id, "": condition]
//                        self.objects.append(obj)
//                    }
                }
        }
    } catch {
        print("Error with JSON: \(error)")
    }
    tableView.reloadData()
}
    


    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        loadjson() //call loadjson
    }

    override func viewWillAppear(animated: Bool) {
        self.clearsSelectionOnViewWillAppear = self.splitViewController!.collapsed
        super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }



    // MARK: - Segues

//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        if segue.identifier == "showDetail" {
//            if let indexPath = self.tableView.indexPathForSelectedRow {
//                let object = objects[indexPath.row]
//                let controller = (segue.destinationViewController as! UINavigationController).topViewController as! DetailViewController
//                controller.detailItem = object
//                controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem()
//                controller.navigationItem.leftItemsSupplementBackButton = true
//            }
//        }
//    }

    // MARK: - Table View

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath
        indexPath: NSIndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
            let object = objects[indexPath.row]
            cell.textLabel!.text = object["item"]
//            if object["count"] != nil {
//                cell.detailTextLabel!.text = object["count"]!
//            }
            return cell
    }

//    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
//        // Return false if you do not want the specified item to be editable.
//        return true
//    }

//    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
//        if editingStyle == .Delete {
//            objects.removeAtIndex(indexPath.row)
//            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
//        } else if editingStyle == .Insert {
//            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
//        }
//    }


}

