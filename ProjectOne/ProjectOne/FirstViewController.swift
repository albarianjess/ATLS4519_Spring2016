//
//  FirstViewController.swift
//  ProjectOne
//
//  Created by Jessie Albarian on 2/29/16.
//  Copyright © 2016 babyllama. All rights reserved.
//

import UIKit



//class Dog {
//    
//    var dogData = [String : [String]]()
//    var names : [String]!
//    
//    lazy var name : String?
//    var status : String?
//    var code : String?
//    var pedigree : String?
//    var breed : String?
//    var sex : String?
//    var age : String?
//    var id : String?
//}

var petList = [String]()



class FirstViewController: UITableViewController {

    

    //----------
    // VARIABLES
    //----------
    // Create data storage object
    var data = NSMutableData()
    var selectedAnimal = 0
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
            cell.textLabel?.text = petList[0]
            cell.textLabel?.font = UIFont(name: "HelveticaNeue", size: 28)
            cell.textLabel?.textAlignment = .Center
            return cell
    }
    
    
    
    


    
    
    
    
    // Required methods for UITableViewDataSource
    // Customize the number of rows in the section
    override func tableView(tableView: UITableView, numberOfRowsInSection
        section: Int) -> Int {
            return petList.count
    }
    
    func getData(){
        if let path = NSBundle.mainBundle().pathForResource("dogData", ofType: "json") {
            do {
                let jsonData = try NSData(contentsOfFile: path, options: NSDataReadingOptions.DataReadingMappedIfSafe)
                do {
                    let jsonResult: NSDictionary = try NSJSONSerialization.JSONObjectWithData(jsonData, options: NSJSONReadingOptions.MutableContainers) as! NSDictionary
                    if let animals : [NSDictionary] = jsonResult["animals"] as? [NSDictionary] {
                        for item in animals {
                            if let name = item["name"] as? String {
                                petList.append(name)
                                print(name)
                            }
                        }
                    }
                } catch {}
            } catch {}
        }
    }
    
    
    override func viewDidLoad() {
//        //----------------------
//        // Get JSON data from URL
//        // Code block from http://www.learnswiftonline.com/mini-tutorials/how-to-download-and-read-json/
//        //----------------------
//        func startConnection() -> [String] {
//            let requestURL: NSURL = NSURL(string: "https://www.jessiealbarian.com/dogdata.json")!
//            let urlRequest: NSMutableURLRequest = NSMutableURLRequest(URL: requestURL)
//            let session = NSURLSession.sharedSession()
//            
//            var petList = [String]()
//            
//            let task = session.dataTaskWithRequest(urlRequest) {
//                (data, response, error) -> Void in
//                
//                let httpResponse = response as! NSHTTPURLResponse
//                let statusCode = httpResponse.statusCode
//                
//                if (statusCode == 200) {
//                    do{
//                        let json = try NSJSONSerialization.JSONObjectWithData(data!, options:.AllowFragments)
//                        
//                        
//                        if let items = json["animals"] as? [[String: AnyObject]] {
//                            for item in items {
//                                if let name = item["name"] as? String {
//                                    petList.append(name)
//                                }
//                                //                            if let status = item["status"] as? String {
//                                //                                petObject.status = status
//                                //                            }
//                                //                            if let sex = item["sex"] as? String {
//                                //                                petObject.sex = sex
//                                //                            }
//                                //                            if let pedigree = item["pedigree"] as? String {
//                                //                                petObject.pedigree = pedigree
//                                //                            }
//                                //                            if let breed = item["breed"] as? String {
//                                //                                petObject.breed = breed
//                                //                            }
//                                //                            if let age = item["age"] as? String {
//                                //                                petObject.age = age
//                                //                            }
//                                //                            if let id = item["id"] as? String {
//                                //                                petObject.id = id
//                                //                            }
//                            }
//                        }
//                    }catch {
//                        print("Error with Json: \(error)")
//                    }
//                }
//            }
//            task.resume()
//            
//            for item in petList {
//                print(item)
//            }
//            return petList
//        }
        
        
        
        
        
        
        
        
        
        
        getData()
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

