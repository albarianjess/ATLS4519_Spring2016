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
    var selectedDog = 0
    // For passing onto next view controller
    var animalList = Dog()
    


    
    
    
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
            cell.textLabel?.text = animalList.nameList[indexPath.row]
            cell.textLabel?.font = UIFont(name: "HelveticaNeue", size: 28)
            cell.textLabel?.textAlignment = .Center
            return cell
    }
    
    
    
    


    
    
    
    
    // Required methods for UITableViewDataSource
    // Customize the number of rows in the section
    override func tableView(tableView: UITableView, numberOfRowsInSection
        section: Int) -> Int {
            return animalList.nameList.count
    }
    
    
    
    //------------------------
    // Get JSON data from file
    //------------------------
    func getData(){
        if let path = NSBundle.mainBundle().pathForResource("dogData", ofType: "json") {
            do {
                let jsonData = try NSData(contentsOfFile: path, options: NSDataReadingOptions.DataReadingMappedIfSafe)
                do {
                    let jsonResult: NSDictionary = try NSJSONSerialization.JSONObjectWithData(jsonData, options: NSJSONReadingOptions.MutableContainers) as! NSDictionary
                    if let animals : [NSDictionary] = jsonResult["animals"] as? [NSDictionary] {
                        for item in animals {
                            if let name = item["name"] as? String {
                                animalList.nameList.append(name)
                            }
                            if let status = item["status"] as? String {
                                animalList.statusList.append(status)
                            }
                            if let sex = item["sex"] as? String {
                                animalList.statusList.append(sex)
                            }
                            if let pedigree = item["pedigree"] as? String {
                                animalList.pedigreeList.append(pedigree)
                            }
                            if let breed = item["breed"] as? String {
                                animalList.breedList.append(breed)
                            }
                            if let age = item["age"] as? String {
                                animalList.ageList.append(age)
                            }
                        }
                    }
                } catch {}
            } catch {}
        }
    }
    
    
    
    //---------------
    // View Did Load
    //---------------
    override func viewDidLoad() {
        getData()
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

