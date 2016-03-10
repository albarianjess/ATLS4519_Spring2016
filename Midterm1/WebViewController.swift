//
//  WebViewController.swift
//  Midterm1
//
//  Created by Jessie Albarian on 3/10/16.
//  Copyright © 2016 babyllama. All rights reserved.
//

import UIKit

class WebViewController: UIViewController {

    @IBOutlet var webView: UIWebView!
    var selectedStore = 0
    var storeList2 = Stores()
    
    
    @IBOutlet var webSpinner: UIActivityIndicatorView!
    
    
    //--------------
    // LOAD WEB PAGE
    //--------------
    func loadWebPage(urlString: String){
        let url = NSURL(string: urlString)
        let request = NSURLRequest(URL: url!)
        webView.loadRequest(request)
    }
    
    //--------------------
    // SPINNDER LOAD START
    //--------------------
    func webViewDidStartLoad(webView: UIWebView) {
        webSpinner.startAnimating()
    }
    
    //--------------------
    // SPINNER LOAD SUCCESS
    //--------------------
    func webViewDidFinishLoad(webView: UIWebView) {
        webSpinner.stopAnimating()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let chosenStore = storeList2.items[selectedStore]
        print(chosenStore)
        if (chosenStore == "Apple"){
            loadWebPage("http://www.apple.com/")
        }
        if (chosenStore == "CU Bookstore"){
            loadWebPage("https://www.cubookstore.com/")
        }
        if (chosenStore == "REI"){
            loadWebPage("https://www.rei.com/")
        }
        if (chosenStore == "King Soopers"){
            loadWebPage("https://www.kingsoopers.com/")
        }
        if (chosenStore == "Sprouts"){
            loadWebPage("https://www.sprouts.com/")
        }
        if (chosenStore == "Amazon"){
            loadWebPage("https://www.amazon.com/")
        }

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
