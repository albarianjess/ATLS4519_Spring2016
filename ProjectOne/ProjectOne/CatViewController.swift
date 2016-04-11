


import UIKit

class CatViewController: UIViewController {
    
    
    var selectedCat = 0
    var catList = Cat()
    
    @IBOutlet var pic: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var breedLabel: UILabel!
    @IBOutlet var sexLabel: UILabel!
    @IBOutlet var ageLabel: UILabel!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    
    override func viewWillAppear(animated: Bool) {
        if (catList.filteredName.isEmpty != true){
            let chosenCat = catList.filteredName[selectedCat]
            // Set label information
            nameLabel.text = "Name: " + chosenCat
            breedLabel.text = "Breed: " + catList.breedList[selectedCat]
            sexLabel.text = "Sex: " + catList.sexList[selectedCat]
            ageLabel.text = "Age: " + catList.ageList[selectedCat]
        } else {
            let chosenCat = catList.nameList[selectedCat]
            // Set label information
            nameLabel.text = "Name: " + chosenCat
            breedLabel.text = "Breed: " + catList.breedList[selectedCat]
            sexLabel.text = "Sex: " + catList.sexList[selectedCat]
            ageLabel.text = "Age: " + catList.ageList[selectedCat]
        }
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
