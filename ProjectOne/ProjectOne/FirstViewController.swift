


import UIKit


var animalList = Dog() // To pass data to next controller

class FirstViewController: UITableViewController {

    

    //-----------
    // VARIABLES
    //-----------
    var data = NSMutableData()  // Create data storage object
    var selectedDog = 0 // Initialize selectedDog
    var objects = [[String:String]]()
    


    //-----------------------
    // PREPARE FOR DOG SEGUE
    //-----------------------
    override func prepareForSegue(segue: UIStoryboardSegue, sender:
        AnyObject?) {
            if segue.identifier == "dogsegue" {
                let detailVC = segue.destinationViewController as! DogViewController
                let indexPath = tableView.indexPathForCell(sender as! UITableViewCell)!
                //sets the data for the destination controller
                detailVC.title = animalList.nameList[indexPath.row]
                detailVC.dogList = animalList
                detailVC.selectedDog = indexPath.row
            }
    }
    
    
    //-------------------------
    // DISPLAY TABLEVIEW CELLS
    //-------------------------
    override func tableView(tableView: UITableView, cellForRowAtIndexPath
        indexPath: NSIndexPath) -> UITableViewCell {
            //configure the cell
            let cell = tableView.dequeueReusableCellWithIdentifier("CellIdentifier", forIndexPath: indexPath)
            
            // Format labels
            cell.textLabel?.text = animalList.nameList[indexPath.row]
            cell.textLabel?.font = UIFont(name: "HelveticaNeue", size: 28)
            cell.textLabel?.textAlignment = .Center
            
            
            // Decode base64 to use as image
            let plainString = animalList.picList[indexPath.row]
            let decodedData = NSData(base64EncodedString: plainString, options: NSDataBase64DecodingOptions(rawValue: 0))
            let decodedimage = UIImage(data: decodedData!)
            let image : UIImage = decodedimage! as UIImage
            cell.imageView!.image = image
            
            // Formatting table view cells source
            //http://www.appcoda.com/customize-table-view-cells-for-uitableview/
            return cell
    }

    
    
    //----------------------
    // # OF ROWS IN SECTION
    //----------------------
    override func tableView(tableView: UITableView, numberOfRowsInSection
        section: Int) -> Int {
            return animalList.nameList.count
    }
    
    
    
    //-------------------------
    // GET JSON DATA FROM FILE
    //-------------------------
//    func getData(){
//        if let path = NSBundle.mainBundle().pathForResource("dogData", ofType: "json") {
//            do {
//                let jsonData = try NSData(contentsOfFile: path, options: NSDataReadingOptions.DataReadingMappedIfSafe)
//                do {
//                    let jsonResult: NSDictionary = try NSJSONSerialization.JSONObjectWithData(jsonData, options: NSJSONReadingOptions.MutableContainers) as! NSDictionary
//                    
//                    // Get JSON data and append to arrays
//                    if let animals : [NSDictionary] = jsonResult["animals"] as? [NSDictionary] {
//                        for item in animals {
//                            if let name = item["name"] as? String {
//                                animalList.nameList.append(name)
//                            }
//                            if let status = item["status"] as? String {
//                                animalList.statusList.append(status)
//                            }
//                            if let sex = item["sex"] as? String {
//                                animalList.sexList.append(sex)
//                            }
//                            if let pedigree = item["pedigree"] as? String {
//                                animalList.pedigreeList.append(pedigree)
//                            }
//                            if let breed = item["breed"] as? String {
//                                animalList.breedList.append(breed)
//                            }
//                            if let age = item["age"] as? String {
//                                animalList.ageList.append(age)
//                            }
//                            if let pic = item["image"] as? String {
//                                animalList.picList.append(pic)
//                            }
//                        }
//                    }
//                } catch {}
//            } catch {}
//        }
//    }

    
    //--------------------
    // Load JSON from URL
    //--------------------
    func loadJSON(){
        let urlPath = "https://www.jessiealbarian.com/dogdata.json"
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
                print("download successful")
                dispatch_async(dispatch_get_main_queue()) { self.parsejson(data!) }
        })
        session.resume()
    }
    
    
    
    //------------
    // Parse JSON
    //------------
    func parsejson(data: NSData){
        do {
            let json = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments) as! NSArray
            for item in json {
                let name = item["name"] as! String
                animalList.nameList.append(name)
                
                print(name)
                let status = item["status"]! as! String
                if status == "Adopt Me"{
                    animalList.statusList.append("Adoptable")
                } else if status == "On Hold" {
                    animalList.statusList.append(status)
                }
                
                let sex = item["sex"]! as! String
                animalList.sexList.append(sex)
                
                let pedigree = item["pedigree"]! as! String
                animalList.pedigreeList.append(pedigree)
                
                let breed = item["breed"]! as! String
                animalList.breedList.append(breed)
                
                let age = item["age"]! as! String
                animalList.ageList.append(age)
                
                let pic = item["image"]! as! String
                animalList.picList.append(pic)
            }
        } catch {
            print("Error with JSON: \(error)")
        }
        tableView.reloadData()
    }
    
    
    
    
    //---------------
    // VIEWDIDLOAD
    //---------------
    override func viewDidLoad() {
//        animalList.getData()
        
        loadJSON()
        // Background image
        //navigationController!.navigationBar.barTintColor = UIColor.orangeColor()
        super.viewDidLoad()
//        animalList.getData()
        //print(animalList.nameList)
//        animalList.getNames()
        
    }
    
    override func viewDidAppear(animated: Bool) {
        loadJSON()
    }
    
    
    //-------------------------
    // DIDRECEIVEMEMORYWARNING
    //-------------------------
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

