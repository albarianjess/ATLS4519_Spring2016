


import UIKit

class CatViewController: UIViewController {
    
    
    var selectedCat = 0
    var catList = [String: Cat]()
    var catNamelist = [String]()
    var filteredNames = [String]()
    
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
        var chosenCat = String()
        if (filteredNames.isEmpty != true){
            chosenCat = filteredNames[selectedCat]
            // Set label information
            nameLabel.text = "Name: " + chosenCat
            breedLabel.text = "Breed: " + catList[chosenCat]!.breed
            sexLabel.text = "Sex: " + catList[chosenCat]!.sex
            ageLabel.text = "Age: " + catList[chosenCat]!.age
        } else {
            chosenCat = catNamelist[selectedCat]
            // Set label information
            nameLabel.text = "Name: " + chosenCat
            breedLabel.text = "Breed: " + catList[chosenCat]!.breed
            sexLabel.text = "Sex: " + catList[chosenCat]!.sex
            ageLabel.text = "Age: " + catList[chosenCat]!.age
        }
        // Decode base64 to use as image
        let plainString = catList[chosenCat]!.pic
        let decodedData = NSData(base64EncodedString: plainString, options: NSDataBase64DecodingOptions(rawValue: 0))
        let decodedimage = UIImage(data: decodedData!)
        pic.image = decodedimage! as UIImage
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
