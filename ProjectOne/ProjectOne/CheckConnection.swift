//
//  CheckConnection.swift
//  ProjectOne
//
//  Created by Jessie Albarian on 4/7/16.
//  Copyright © 2016 babyllama. All rights reserved.
//

import Foundation
var status : Int = 0

class CheckConnection {
    
    
    

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
                    status = 200
                    print("file download error")
                    return
            }
            print("download successful")
        })
        session.resume()
    }
}