//
//  FirstViewController.swift
//  ProjectOne
//
//  Created by Jessie Albarian on 2/29/16.
//  Copyright © 2016 babyllama. All rights reserved.
//

import UIKit

class FirstViewController: UITableViewController {

    

    //----------
    // VARIABLES
    //----------
    // Create data storage object
    var data = NSMutableData()
    var animals = [String]()
    var selectedAnimal = 0
//    let dogItems = ["dog1","dog2","dog3"]
//    var animal = [Animal]()
    var animalList = Animal()
//    var arr = [String]() or var arr : [String]!
    

    
    override func prepareForSegue(segue: UIStoryboardSegue, sender:
        AnyObject?) {
            if segue.identifier == "dogsegue" {
                let detailVC = segue.destinationViewController as!
                DogViewController
                let indexPath = tableView.indexPathForCell(sender as!
                    UITableViewCell)!
                //sets the data for the destination controller
                detailVC.title = animalList.names[indexPath.row]
                detailVC.dogList = animalList
                detailVC.selectedDog = indexPath.row
            }
    }
    
    
    
    //--------------------------
    // Displays table view cells
    //--------------------------
    override func tableView(tableView: UITableView, cellForRowAtIndexPath
        indexPath: NSIndexPath) -> UITableViewCell {
            //configure the cell
            let cell = tableView.dequeueReusableCellWithIdentifier("CellIdentifier", forIndexPath: indexPath)


            // Format labels
            cell.textLabel?.text = animalList.names[indexPath.row]
//            cell.textLabel?.font = UIFont(name: "HelveticaNeue", size: 28)
//            cell.textLabel?.textAlignment = .Center
            
            //Add Images
//            let imageName = UIImage(named: dogItems[indexPath.row])
//            cell.imageView?.image = imageName
            
//            let section = indexPath.section
//            let name = animalList.names[section]
//            
//            if (name == "Moose"){
//                cell.imageView?.image = UIImage(named: "dog1")
//            } else if (name == "Blanco"){
//                cell.imageView?.image = UIImage(named: "dog2")
//            } else {
//                cell.imageView?.image = UIImage(named: "dog3")
//            }
            return cell
    }
    
    
    
    //------------------------
    // Get data from JSON file
    //------------------------
    func startConnection() {
        let requestURL: NSURL = NSURL(string: "https://www.jessiealbarian.com/dogdata.json")!
        let urlRequest: NSMutableURLRequest = NSMutableURLRequest(URL: requestURL)
        let session = NSURLSession.sharedSession()
//        var nameSet = [String]()
    

        let task = session.dataTaskWithRequest(urlRequest) {
            (data, response, error) -> Void in
            
            let httpResponse = response as! NSHTTPURLResponse
            let statusCode = httpResponse.statusCode
            
            
            
            if (statusCode == 200) {
                do{
                    let json = try NSJSONSerialization.JSONObjectWithData(data!, options:.AllowFragments)
                    let petObject = Animal()
                    if let items = json["animals"] as? [[String: AnyObject]] {
                        for item in items {
                            if let name = item["name"] as? String {
                                petObject.name = name
                                petObject.names.append(name)
//                                print(name)
                            }
                        }
                    }
                }catch {
                    print("Error with Json: \(error)")
                }
            }
        }
        task.resume()
        
    }
    
    
    
    // Required methods for UITableViewDataSource
    // Customize the number of rows in the section
    override func tableView(tableView: UITableView, numberOfRowsInSection
        section: Int) -> Int {
            return animalList.animalData.count
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let path = NSBundle.mainBundle().pathForResource("dogData", ofType: "plist")
//        animalList.animalData = NSArray(contentsOfFile: path!) as! [String]!
        animalList.animalData = NSDictionary(contentsOfFile: path!) as! [String : [String]]
        animalList.names = Array(animalList.animalData.keys)
//        print(animalList.animalData)
    }


    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    

}

