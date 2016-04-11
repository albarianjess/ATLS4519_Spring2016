


import UIKit


var myCatList = Cat() // To pass data to next controller

class SecondViewController: UITableViewController, UISearchBarDelegate {
    
    
    
    //-----------
    // VARIABLES
    //-----------
    var data = NSMutableData()  // Create data storage object
    var selectedCat = 0 // Initialize selectedDog
    var objects = [[String:String]]()
    
    var names = Array(myCatList.searchObjects.values)
    
    @IBOutlet var searchBar: UISearchBar!
    var searchActive : Bool = false
    
    
    
    
    
    //-----------------------
    // PREPARE FOR DOG SEGUE
    //-----------------------
    override func prepareForSegue(segue: UIStoryboardSegue, sender:
        AnyObject?) {
            if segue.identifier == "catsegue" {
                let detailVC = segue.destinationViewController as! CatViewController
                let indexPath = tableView.indexPathForCell(sender as! UITableViewCell)!
                
                //sets the data for the destination controller
                if(searchActive){
                    detailVC.title = myCatList.filteredName[indexPath.row]
                    detailVC.catList = myCatList
                    detailVC.selectedCat = indexPath.row
                    detailVC.catList.catObject = myCatList.searchObjects
                    detailVC.catList.ageList = myCatList.filteredAge
                    detailVC.catList.sexList = myCatList.filteredSex
                    detailVC.catList.breedList = myCatList.filteredBreed
                    detailVC.catList.picList = myCatList.filteredPic
                } else {
                    detailVC.title = myCatList.nameList[indexPath.row]
                    detailVC.catList = myCatList
                    detailVC.selectedCat = indexPath.row
                }
                
            }
    }
    
    
    
    //-------------------------
    // DISPLAY TABLEVIEW CELLS
    //-------------------------
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
            //configure the cell
        let cell = tableView.dequeueReusableCellWithIdentifier("CellIdentifier", forIndexPath: indexPath)
    
        
        
        if(searchActive == true){
            cell.textLabel?.text = myCatList.filteredName[indexPath.row]
    
            
//            let plainString = myCatList.picList[indexPath.row]
//            let decodedData = NSData(base64EncodedString: plainString, options: NSDataBase64DecodingOptions(rawValue: 0))
//            let decodedimage = UIImage(data: decodedData!)
//            let image : UIImage = decodedimage! as UIImage
//            cell.imageView!.image = image
//            
//            tableView.reloadData()
        } else {
            cell.textLabel?.text = myCatList.nameList[indexPath.row]
            
            let plainString = myCatList.picList[indexPath.row]
            let decodedData = NSData(base64EncodedString: plainString, options: NSDataBase64DecodingOptions(rawValue: 0))
            let decodedimage = UIImage(data: decodedData!)
            let image : UIImage = decodedimage! as UIImage
            cell.imageView!.image = image
        }
        
        
        cell.textLabel?.font = UIFont(name: "HelveticaNeue", size: 28)
        cell.textLabel?.textAlignment = .Center
        
            // Formatting table view cells source
            //http://www.appcoda.com/customize-table-view-cells-for-uitableview/
            return cell
    }
    
    
    
    func searchBarTextDidBeginEditing(searchBar: UISearchBar) {
        searchActive = true;
    }
    
    func searchBarTextDidEndEditing(searchBar: UISearchBar) {
        searchActive = false;
    }
    
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        searchActive = false;
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        searchActive = false;
    }
    
    
    //----------------------
    // # OF ROWS IN SECTION
    //----------------------
    override func tableView(tableView: UITableView, numberOfRowsInSection
        section: Int) -> Int {
        if(searchActive) {
            return myCatList.filteredName.count
        } else {
            return myCatList.nameList.count
        }
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
    
    
    
    //--------------------
    // Search bar function
    //--------------------
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        
        
        names = myCatList.nameList.filter({ (text) -> Bool in
            let tmp: NSString = text
            let range = tmp.rangeOfString(searchText, options: NSStringCompareOptions.CaseInsensitiveSearch)
            return range.location != NSNotFound
            })
        
        
        if(myCatList.filteredName.count == 0){
            searchActive = false;
        } else {
            searchActive = true;
        }
        self.tableView.reloadData()
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
                myCatList.nameList.append(name)
                myCatList.catObject["name"] = name
                
                let sex = item["sex"]! as! String
                myCatList.sexList.append(sex)
                myCatList.catObject["sex"] = sex
                
                let breed = item["breed"]! as! String
                myCatList.breedList.append(breed)
                myCatList.catObject["breed"] = breed
                
                let age = item["age"]! as! String
                myCatList.ageList.append(age)
                myCatList.catObject["age"] = age
                
                let pic = item["image"]! as! String
                myCatList.picList.append(pic)
                myCatList.catObject["pic"] = pic
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
        if (myCatList.nameList.isEmpty == true){
            loadJSON()
        }
        
        
        super.viewDidLoad()
        searchBar.delegate = self
        
//        myCatList.filteredName = myCatList.nameList
        myCatList.filteredName = names
        myCatList.searchObjects = myCatList.catObject
    }
   
    
    
    //-------------------------
    // DIDRECEIVEMEMORYWARNING
    //-------------------------
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

