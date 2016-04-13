


import UIKit

class SmallViewController: UIViewController {
    
    
    var selectedSmall = 0
    var smallList = [String: Small]()
    var smallNamelist = [String]()
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
        var chosenSmall = String()
        if (filteredNames.isEmpty != true){
            chosenSmall = filteredNames[selectedSmall]
            // Set label information
            nameLabel.text = "Name: " + chosenSmall
            breedLabel.text = "Breed: " + smallList[chosenSmall]!.breed
            sexLabel.text = "Sex: " + smallList[chosenSmall]!.sex
            ageLabel.text = "Age: " + smallList[chosenSmall]!.age
        } else {
            chosenSmall = smallNamelist[selectedSmall]
            // Set label information
            nameLabel.text = "Name: " + chosenSmall
            breedLabel.text = "Breed: " + smallList[chosenSmall]!.breed
            sexLabel.text = "Sex: " + smallList[chosenSmall]!.sex
            ageLabel.text = "Age: " + smallList[chosenSmall]!.age
        }
        // Decode base64 to use as image
        let plainString = smallList[chosenSmall]!.pic
        let decodedData = NSData(base64EncodedString: plainString, options: NSDataBase64DecodingOptions(rawValue: 0))
        let decodedimage = UIImage(data: decodedData!)
        pic.image = decodedimage! as UIImage
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
