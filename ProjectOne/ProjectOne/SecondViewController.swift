


import UIKit



var myCatList = [String: Cat]()

class SecondViewController: UITableViewController, UISearchBarDelegate {
    
    
    
    //-----------
    // VARIABLES
    //-----------
    var catNamelist = [String]()
    var filteredNames = [String]()
    
    
    var data = NSMutableData()  // Create data storage object
    var selectedCat = 0 // Initialize selectedDog
    var objects = [[String:String]]()
    
    
    
    //-----------------------
    // PREPARE FOR CAT SEGUE
    //-----------------------
    override func prepareForSegue(segue: UIStoryboardSegue, sender:
        AnyObject?) {
            if segue.identifier == "catsegue" {
                let detailVC = segue.destinationViewController as! CatViewController
                let indexPath = tableView.indexPathForCell(sender as! UITableViewCell)!
                
                detailVC.title = catNamelist[indexPath.row]
                detailVC.catNamelist = catNamelist
                detailVC.catList = myCatList
                detailVC.selectedCat = indexPath.row
                
            }
    }
    
    
    
    //-------------------------
    // DISPLAY TABLEVIEW CELLS
    //-------------------------
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
            //configure the cell
        let cell = tableView.dequeueReusableCellWithIdentifier("CellIdentifier", forIndexPath: indexPath)
    
        cell.textLabel?.font = UIFont(name: "HelveticaNeue", size: 28)
        cell.textLabel?.textAlignment = .Center
        
        cell.textLabel?.text = catNamelist[indexPath.row]
        let plainString = myCatList[catNamelist[indexPath.row]]!.pic
        let decodedData = NSData(base64EncodedString: plainString, options: NSDataBase64DecodingOptions(rawValue: 0))
        let decodedimage = UIImage(data: decodedData!)
        let image : UIImage = decodedimage! as UIImage
        cell.imageView!.image = image
        
        return cell
            // Formatting table view cells source
            //http://www.appcoda.com/customize-table-view-cells-for-uitableview/
    }
    
    
    
    
    //----------------------
    // # OF ROWS IN SECTION
    //----------------------
    override func tableView(tableView: UITableView, numberOfRowsInSection
        section: Int) -> Int {
        return catNamelist.count
    }
    
    
    
    //--------------------
    // Load JSON from URL
    //--------------------
    func loadJSON(){
        let urlPath = "https://www.jessiealbarian.com/catdata.json"
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
            let json = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments) as! NSDictionary
            let allresults = json["boulder, CO"] as! NSArray
            let results = Array(allresults)
            for item in results {
                let name = item["name"] as! String
                
                let sex = item["sex"]! as! String
                
                let breed = item["breed"]! as! String
                
                let age = item["age"]! as! String
                
                let pic = item["image"]! as! String
                
                myCatList[name] = Cat(newName: name, newSex: sex, newBreed: breed, newAge: age, newPic: pic)
                catNamelist.append(name)
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
        if (myCatList.isEmpty == true){
            loadJSON()
        }
        
        super.viewDidLoad()
    }
   
    
    
    //-------------------------
    // DIDRECEIVEMEMORYWARNING
    //-------------------------
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

