//
//  ViewController.swift
//  Lab3
//
//  Created by Jessie Albarian on 2/5/16.
//  Copyright © 2016 babyllama. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    
    // Variables
    var placesList = Places()
    let filename = "data.plist"
    
    
    
    func docFilePath(filename: String) -> String?{
        //locate the documents directory
        let path =
        NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory,
            NSSearchPathDomainMask.AllDomainsMask, true)
        let dir = path[0] as NSString //document directory
        //creates the full path to our data file
        return dir.stringByAppendingPathComponent(filename)
    }
    
    

    
    
    //Number of rows in the section
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return placesList.placesData.count
    }
    
    
    // Displays table view cells
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
            //configure the cell
            let cell = tableView.dequeueReusableCellWithIdentifier("CellIdentifier", forIndexPath:indexPath)
            cell.textLabel?.text = placesList.places[indexPath.row]
        
        
        //Add Images
        let section = indexPath.section
        let name = placesList.places[section]
        
        if (name == "Buildings"){
            cell.imageView?.image = UIImage(named: "norlin.jpg")
        } else if (name == "Libraries"){
            cell.imageView?.image = UIImage(named: "library.jpg")
        } else if (name == "Coffee Shops"){
            cell.imageView?.image = UIImage(named: "coffee.jpg")
        }
            
        
        

            return cell
    }
    
    
    //Runs before view appears
    override func viewDidLoad() {
        super.viewDidLoad()
//        let path = NSBundle.mainBundle().pathForResource("Places", ofType: "plist") //Gets Plist data
//        placesList.placesData = NSDictionary(contentsOfFile: path!) as! [String : [String]] //Puts in dictionary
//        placesList.places = Array(placesList.placesData.keys) //Adds contents to array
        
        
        
        let path : String?
        let filePath = docFilePath(filename) //path to data file
        if (NSFileManager.defaultManager().fileExistsAtPath(filePath!)) {
            path = filePath
            print(path)
        } else {
            //use a NSBundle object of the directory for our application to retrieve the pathname of our initial plist
            path = NSBundle.mainBundle().pathForResource("Places", ofType: "plist")
            print(path)
        }
        
        //load the data of the plist file into the dictionary
        placesList.placesData = NSDictionary(contentsOfFile: path!)as! [String : [String]]
        //puts all the continents in an array
        placesList.places = Array(placesList.placesData.keys)
        
        //application instance
        let app = UIApplication.sharedApplication()
        //subscribe to the UIApplicationWillResignActiveNotification notification
        NSNotificationCenter.defaultCenter().addObserver(self, selector:
            "applicationWillResignActive:", name:
            "UIApplicationWillResignActiveNotification", object: app)
    }

    func applicationWillResignActive(notification: NSNotification){
        let filePath = docFilePath(filename)
        let data = NSMutableDictionary()
        //adds our whole dictionary to the data dictionary
        data.addEntriesFromDictionary(placesList.placesData)
        print(data)
        //write the contents of the array to our plist file
        data.writeToFile(filePath!, atomically: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // Tells next view what data to provide
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "placesSegue"){
            let detailVC = segue.destinationViewController as! DetailsViewController
            let indexPath = tableView.indexPathForCell(sender as! UITableViewCell)!
            //sets the data for the destination controller
            detailVC.title = placesList.places[indexPath.row]
            detailVC.placesDetail = placesList
            detailVC.selectedPlace = indexPath.row
        }
        else if (segue.identifier == "infoSegue"){
            let infoVC = segue.destinationViewController as! InfoViewController
            let editingCell = sender as! UITableViewCell
            let indexPath = tableView.indexPathForCell(editingCell)
            infoVC.name = placesList.places[indexPath!.row]
            let place = placesList.placesData[infoVC.name]! as [String]
            infoVC.number = String(place.count)
        }
    }


}

