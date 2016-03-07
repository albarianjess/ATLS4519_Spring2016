


import UIKit


class SecondViewController: UITableViewController {
    
    
    
    //-----------
    // VARIABLES
    //-----------
    var data = NSMutableData()  // Create data storage object
    var selectedCat = 0 // Initialize selectedDog
    var animalList = Cat() // To pass data to next controller
    
    
    
    //-----------------------
    // PREPARE FOR DOG SEGUE
    //-----------------------
    override func prepareForSegue(segue: UIStoryboardSegue, sender:
        AnyObject?) {
            if segue.identifier == "catsegue" {
                let detailVC = segue.destinationViewController as! CatViewController
                let indexPath = tableView.indexPathForCell(sender as! UITableViewCell)!
                //sets the data for the destination controller
                detailVC.title = animalList.nameList[indexPath.row]
                detailVC.catList = animalList
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
    func getData(){
        if let path = NSBundle.mainBundle().pathForResource("catData", ofType: "json") {
            do {
                let jsonData = try NSData(contentsOfFile: path, options: NSDataReadingOptions.DataReadingMappedIfSafe)
                do {
                    let jsonResult: NSDictionary = try NSJSONSerialization.JSONObjectWithData(jsonData, options: NSJSONReadingOptions.MutableContainers) as! NSDictionary
                    
                    // Get JSON data and append to arrays
                    if let animals : [NSDictionary] = jsonResult["animals"] as? [NSDictionary] {
                        for item in animals {
                            if let name = item["name"] as? String {
                                animalList.nameList.append(name)
                            }
                            if let status = item["status"] as? String {
                                animalList.statusList.append(status)
                            }
                            if let sex = item["sex"] as? String {
                                animalList.sexList.append(sex)
                            }
                            if let personality = item["personality"] as? String {
                                animalList.personList.append(personality)
                            }
                            if let breed = item["breed"] as? String {
                                animalList.breedList.append(breed)
                            }
                            if let age = item["age"] as? String {
                                animalList.ageList.append(age)
                            }
                            if let pic = item["image"] as? String {
                                animalList.picList.append(pic)
                            }
                        }
                    }
                } catch {}
            } catch {}
        }
    }
    
    
    
    //---------------
    // VIEWDIDLOAD
    //---------------
    override func viewDidLoad() {
        getData()
        // Background image
        tableView.backgroundView = UIImageView(image: UIImage(named: "kitty"))
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

