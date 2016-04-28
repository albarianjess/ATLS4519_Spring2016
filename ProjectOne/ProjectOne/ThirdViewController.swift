


import UIKit



var mySmallList = [String: Small]()

class ThirdViewController: UITableViewController {
    
    
    
    //-----------
    // VARIABLES
    //-----------
    var smallNamelist = [String]()
    var filteredNames = [String]()
    
    
    var data = NSMutableData()  // Create data storage object
    var selectedSmall = 0 // Initialize selectedDog
    var objects = [[String:String]]()
    
    
    
    //-----------------------
    // PREPARE FOR DOG SEGUE
    //-----------------------
    override func prepareForSegue(segue: UIStoryboardSegue, sender:
        AnyObject?) {
        if segue.identifier == "smallsegue" {
            let detailVC = segue.destinationViewController as! SmallViewController
            let indexPath = tableView.indexPathForCell(sender as! UITableViewCell)!
            
            detailVC.title = smallNamelist[indexPath.row]
            detailVC.smallNamelist = smallNamelist
            detailVC.smallList = mySmallList
            detailVC.selectedSmall = indexPath.row
            
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
        
        cell.textLabel?.text = smallNamelist[indexPath.row]
        let plainString = mySmallList[smallNamelist[indexPath.row]]!.pic
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
        return smallNamelist.count
    }
    
    
    
    //--------------------
    // Load JSON from URL
    //--------------------
    func loadJSON(){
        let urlPath = "https://www.jessiealbarian.com/smalldata.json"
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
                
                mySmallList[name] = Small(newName: name, newSex: sex, newBreed: breed, newAge: age, newPic: pic)
                smallNamelist.append(name)
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
        if (mySmallList.isEmpty == true){
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

