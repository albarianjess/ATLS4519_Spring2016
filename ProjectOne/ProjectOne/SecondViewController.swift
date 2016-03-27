


import UIKit


var myCatList = Cat() // To pass data to next controller

class SecondViewController: UITableViewController {
    
    
    
    //-----------
    // VARIABLES
    //-----------
    var data = NSMutableData()  // Create data storage object
    var selectedCat = 0 // Initialize selectedDog
    var objects = [[String:String]]()
    
    
    @IBOutlet var searching: UISearchBar!
    
    //-----------------------
    // PREPARE FOR DOG SEGUE
    //-----------------------
    override func prepareForSegue(segue: UIStoryboardSegue, sender:
        AnyObject?) {
            if segue.identifier == "catsegue" {
                let detailVC = segue.destinationViewController as! CatViewController
                let indexPath = tableView.indexPathForCell(sender as! UITableViewCell)!
                //sets the data for the destination controller
                detailVC.title = myCatList.nameList[indexPath.row]
                detailVC.catList = myCatList
                detailVC.selectedCat = indexPath.row
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
            cell.textLabel?.text = myCatList.nameList[indexPath.row]
            cell.textLabel?.font = UIFont(name: "HelveticaNeue", size: 28)
            cell.textLabel?.textAlignment = .Center
            
            
            // Decode base64 to use as image
            let plainString = myCatList.picList[indexPath.row]
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
            return myCatList.nameList.count
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
            let json = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments) as! NSArray
            for item in json {
                let name = item["name"] as! String
                myCatList.nameList.append(name)
                let status = item["status"]! as! String
                if status == "Adopt Me"{
                    myCatList.statusList.append("Adoptable")
                } else if status == "On Hold" {
                    myCatList.statusList.append(status)
                }
                let sex = item["sex"]! as! String
                myCatList.sexList.append(sex)
                
                let pedigree = item["personality"]! as! String
                myCatList.personList.append(pedigree)
                
                let breed = item["breed"]! as! String
                myCatList.breedList.append(breed)
                
                let age = item["age"]! as! String
                myCatList.ageList.append(age)
                
                let pic = item["image"]! as! String
                myCatList.picList.append(pic)
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
        loadJSON()
        super.viewDidLoad()
        
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

