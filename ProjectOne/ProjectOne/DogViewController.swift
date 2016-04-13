


import UIKit

class DogViewController: UIViewController {
    
    
    var selectedDog = 0
    var dogList = [String: Dog]()
    var dogNamelist = [String]()
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
        var chosenDog = String()
        if (filteredNames.isEmpty != true){
            chosenDog = filteredNames[selectedDog]
            // Set label information
            nameLabel.text = "Name: " + chosenDog
            breedLabel.text = "Breed: " + dogList[chosenDog]!.breed
            sexLabel.text = "Sex: " + dogList[chosenDog]!.sex
            ageLabel.text = "Age: " + dogList[chosenDog]!.age
        } else {
            chosenDog = dogNamelist[selectedDog]
            // Set label information
            nameLabel.text = "Name: " + chosenDog
            breedLabel.text = "Breed: " + dogList[chosenDog]!.breed
            sexLabel.text = "Sex: " + dogList[chosenDog]!.sex
            ageLabel.text = "Age: " + dogList[chosenDog]!.age
        }
        // Decode base64 to use as image
        let plainString = dogList[chosenDog]!.pic
        let decodedData = NSData(base64EncodedString: plainString, options: NSDataBase64DecodingOptions(rawValue: 0))
        let decodedimage = UIImage(data: decodedData!)
        pic.image = decodedimage! as UIImage
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
