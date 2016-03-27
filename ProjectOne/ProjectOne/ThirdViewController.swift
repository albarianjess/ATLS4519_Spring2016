


import UIKit


var smallList = Small() // To pass data to next controller

class ThirdViewController: UITableViewController {
    
    
    
    //-----------
    // VARIABLES
    //-----------
    var data = NSMutableData()  // Create data storage object
    var selectedSmall = 0 // Initialize selectedDog
    var objects = [[String:String]]()
    var searchController : UISearchController!
    
    @IBOutlet var searching: UISearchBar!
    
    //-----------------------
    // PREPARE FOR SMALL SEGUE
    //-----------------------
    override func prepareForSegue(segue: UIStoryboardSegue, sender:
        AnyObject?) {
            if segue.identifier == "smallsegue" {
                let detailVC = segue.destinationViewController as! SmallViewController
                let indexPath = tableView.indexPathForCell(sender as! UITableViewCell)!
                //sets the data for the destination controller
                detailVC.title = animalList.nameList[indexPath.row]
                detailVC.smallList = smallList
                detailVC.selectedSmall = indexPath.row
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
            cell.textLabel?.text = smallList.nameList[indexPath.row]
            cell.textLabel?.font = UIFont(name: "HelveticaNeue", size: 28)
            cell.textLabel?.textAlignment = .Center
            
            
            // Decode base64 to use as image
            let plainString = smallList.picList[indexPath.row]
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
            return smallList.nameList.count
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
                smallList.nameList.append(name)
//                
//                print(name)
//                let status = item["status"]! as! String
//                if status == "Adopt Me"{
//                    smallList.statusList.append("Adoptable")
//                } else if status == "On Hold" {
//                    smallList.statusList.append(status)
//                }
                
                let sex = item["sex"]! as! String
                smallList.sexList.append(sex)
                
//                let pedigree = item["pedigree"]! as! String
//                smallList.pedigreeList.append(pedigree)
                
                let breed = item["breed"]! as! String
                smallList.breedList.append(breed)
                
                let age = item["age"]! as! String
                smallList.ageList.append(age)
                
                let pic = item["image"]! as! String
                smallList.picList.append(pic)
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

