//
//  DetailViewController.swift
//  Lab5
//
//  Created by Jessie Albarian on 2/25/16.
//  Copyright © 2016 babyllama. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    
    var imageName : String?
    
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        if let name = imageName {
            imageView.image = UIImage(named: name)
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
