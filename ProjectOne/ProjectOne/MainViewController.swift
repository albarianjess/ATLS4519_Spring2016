//
//  MainViewController.swift
//  ProjectOne
//
//  Created by Jessie Albarian on 4/7/16.
//  Copyright © 2016 babyllama. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    
    let checkConnection = CheckConnection()
    var timer = NSTimer()
    @IBOutlet var spin: UIActivityIndicatorView!
    @IBOutlet var loadingText: UILabel!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkConnection.loadJSON()
        if (status == 200){
            loadingText.text = "Unable to connect. Please check your connection and try again"
        } else {
            spin.startAnimating()
            print(status)
            
            // TIMER //
            let triggerTime = (Int64(NSEC_PER_SEC) * 2)
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, triggerTime), dispatch_get_main_queue(), { () -> Void in
                self.nextView()
            })
            
            loadingText.text = "Loading Adoption Info"
        }
    }
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    func nextView(){
//            let secondViewController = self.storyboard?.instantiateViewControllerWithIdentifier("nextView") as! FirstViewController
//            self.presentViewController(secondViewController, animated: true, completion: nil)
//        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewControllerWithIdentifier("nextView") as! UITabBarController
        self.presentViewController(nextViewController, animated:true, completion:nil)
        
        spin.stopAnimating()
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
