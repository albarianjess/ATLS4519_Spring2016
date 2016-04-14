


import UIKit



var dogList = [String: Dog]()


class FirstViewController: UITableViewController, UISearchBarDelegate {
    
    
    
    //-----------
    // VARIABLES
    //-----------
    var dogNamelist = [String]()
    var filteredNames = [String]()
    
    
    var data = NSMutableData()  // Create data storage object
    var selectedDog = 0 // Initialize selectedDog
    var objects = [[String:String]]()
    
    
    @IBOutlet var searchBar: UISearchBar!
    var searchActive : Bool = false
    
    
    
    //---------------
    // HIDE KEYBOARD
    //---------------
//    func hideKeyboardWhenTappedAround() {
//        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(FirstViewController.dismissKeyboard))
//        view.addGestureRecognizer(tap)
//    }
//    
//    func dismissKeyboard() {
//        view.endEditing(true)
//    }
//    
    
    
    //-----------------------
    // PREPARE FOR DOG SEGUE
    //-----------------------
    override func prepareForSegue(segue: UIStoryboardSegue, sender:
        AnyObject?) {
        if segue.identifier == "dogsegue" {
            let detailVC = segue.destinationViewController as! DogViewController
            let indexPath = tableView.indexPathForCell(sender as! UITableViewCell)!
            
            //sets the data for the destination controller
            if(searchActive){
                detailVC.title = filteredNames[indexPath.row]
                detailVC.filteredNames = filteredNames
                detailVC.dogList = dogList
                detailVC.selectedDog = indexPath.row
            } else {
                detailVC.title = dogNamelist[indexPath.row]
                detailVC.dogNamelist = dogNamelist
                detailVC.dogList = dogList
                detailVC.selectedDog = indexPath.row
            }
            
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
        
        if(searchActive){
            cell.textLabel?.text = filteredNames[indexPath.row]
            
            if (dogList[filteredNames[indexPath.row]]!.pic == "none") {
                let imageName = "notavailable"
                let image = UIImage(named: imageName)
                //                let imageView = UIImageView(image: image!)
                cell.imageView!.image = image
            } else {
                let plainString = dogList[filteredNames[indexPath.row]]!.pic
                let decodedData = NSData(base64EncodedString: plainString, options: NSDataBase64DecodingOptions(rawValue: 0))
                let decodedimage = UIImage(data: decodedData!)
                let image : UIImage = decodedimage! as UIImage
                cell.imageView!.image = image
            }
            return cell
            
            
            
        } else {
            cell.textLabel?.text = dogNamelist[indexPath.row]
        
            
            
            if (dogList[dogNamelist[indexPath.row]]!.pic == "none") {
                let imageName = "notavailable"
                let image = UIImage(named: imageName)
//                let imageView = UIImageView(image: image!)
                cell.imageView!.image = image
            } else {
            let plainString = dogList[dogNamelist[indexPath.row]]!.pic
            let decodedData = NSData(base64EncodedString: plainString, options: NSDataBase64DecodingOptions(rawValue: 0))
            let decodedimage = UIImage(data: decodedData!)
            let image : UIImage = decodedimage! as UIImage
            cell.imageView!.image = image
            }
            return cell
        }
        // Formatting table view cells source
        //http://www.appcoda.com/customize-table-view-cells-for-uitableview/
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
            return filteredNames.count
        } else {
            return dogNamelist.count
        }
    }
    
    
    
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
    
    
    
    //--------------------
    // Search bar function
    //--------------------
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
//        if (searchText.isEmpty == true){
//            filteredNames = dogNamelist
//        } else {
        
        var i : Int = 0
        while(i < dogNamelist.count){
            for item in dogNamelist{
                filteredNames.append(item)
                i += 1
            }
        }
        
        
        filteredNames = dogNamelist.filter({ (text) -> Bool in
            let tmp: NSString = text // the name from the variable decleration
            let range = tmp.rangeOfString(searchText, options: NSStringCompareOptions.CaseInsensitiveSearch)
            return range.location != NSNotFound
        })
        
        
        if(filteredNames.count == 0){
            searchActive = false;
        } else {
            searchActive = true;
        }
        self.tableView.reloadData()
//        }
    }
    
    
    
    
    //------------
    // Parse JSON
    //------------
    func parsejson(data: NSData){
        do {
            let json = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments) as! NSDictionary
            
            // BOULDER
            let allresults = json["boulder, CO"] as! NSArray
            let results = Array(allresults)
            for item in results {
                let name = item["name"] as! String
                
                let sex = item["sex"]! as! String
                
                let breed = item["breed"]! as! String
                
                let age = item["age"]! as! String
                
                let pic = item["image"]! as! String
                
                dogList[name] = Dog(newName: name, newSex: sex, newBreed: breed, newAge: age, newPic: pic)
                dogNamelist.append(name)
            }
            
            
            // LONGMONT
            let longmontresults = json["longmont, CO"] as! NSArray
            let longresults = Array(longmontresults)
            for item in longresults {
                let name = item["name"] as! String
                
                let sex = item["sex"]! as! String
                
                let breed = item["pedigree"]! as! String
                
                let age = item["age"]! as! String
                
                var pic = item["image"]! as! String
                
                if (pic.containsString("////")){
                    pic = notAvailablePic
                }
                
                dogList[name] = Dog(newName: name, newSex: sex, newBreed: breed, newAge: age, newPic: pic)
                dogNamelist.append(name)
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
        //Check is arrays are empty when going back to view
        if (dogList.isEmpty == true){
            loadJSON()
        }
        
        super.viewDidLoad()
        searchBar.delegate = self
//        self.hideKeyboardWhenTappedAround()
    }
    
    
    
    //-------------------------
    // DIDRECEIVEMEMORYWARNING
    //-------------------------
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    var notAvailablePic = "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"
}

