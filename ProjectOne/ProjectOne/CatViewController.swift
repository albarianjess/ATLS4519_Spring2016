


import UIKit

class CatViewController: UIViewController {
    
    
    var selectedCat = 0
    var catList = Cat()
    
    @IBOutlet var pic: UIImageView!
    @IBOutlet var statusLabel: UILabel!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var breedLabel: UILabel!
    @IBOutlet var personLabel: UILabel!
    @IBOutlet var sexLabel: UILabel!
    @IBOutlet var ageLabel: UILabel!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    
    override func viewWillAppear(animated: Bool) {
        let chosenCat = catList.nameList[selectedCat]
        
        // Set label information
        nameLabel.text = "Name: " + chosenCat
        statusLabel.text = "Status: " + catList.statusList[selectedCat]
        breedLabel.text = "Breed: " + catList.breedList[selectedCat]
        personLabel.text = "Personality: " + catList.personList[selectedCat]
        sexLabel.text = "Sex: " + catList.sexList[selectedCat]
        ageLabel.text = "Age: " + catList.ageList[selectedCat]
        
        // Decode base64 to use as image
        let plainString = catList.picList[selectedCat]
        let decodedData = NSData(base64EncodedString: plainString, options: NSDataBase64DecodingOptions(rawValue: 0))
        let decodedimage = UIImage(data: decodedData!)
        pic.image = decodedimage! as UIImage
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
