//
//  ViewController.swift
//  Project1
//
//  Created by Jessie Albarian on 2/23/16.
//  Copyright © 2016 babyllama. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation


class ViewController: UIViewController, CLLocationManagerDelegate {

    var locationManager = CLLocationManager()
    
//    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        <#code#>
//    }
    
    
    
//    func locationManager(manager: CLLocationManager,didChangeAuthorizationStatus status: CLAuthorizationStatus) {
//        print("didchangeauth")
//        if status==CLAuthorizationStatus.AuthorizedWhenInUse {
//            locationManager.startUpdatingLocation() //starts the location manager
//        }
//        locationManager.delegate=self
//        locationManager.desiredAccuracy=kCLLocationAccuracyBest
//        locationManager.distanceFilter=kCLDistanceFilterNone
//    }
    
    
    func locationManager(manager: CLLocationManager,
        didChangeAuthorizationStatus status: CLAuthorizationStatus) {
            print("didchangeauth")
            if status==CLAuthorizationStatus.AuthorizedWhenInUse {
                locationManager.startUpdatingLocation() //starts the location
                manager
            }
        }
    
    
    //called when location cannot be determined
    func locationManager(manager: CLLocationManager, didFailWithError
        error: NSError) {
            var errorType=String()
            if let clError=CLError(rawValue: error.code) {
                if clError == .Denied {
                    errorType="access denied"
                    let alert=UIAlertController(title: "Error", message:
                        errorType, preferredStyle: UIAlertControllerStyle.Alert)
                    let okAction:UIAlertAction=UIAlertAction(title: "OK",
                        style:UIAlertActionStyle.Default, handler: nil)
                    alert.addAction(okAction)
                    presentViewController(alert, animated: true, completion:
                        nil)
                }
            }
    }
            
            
    override func viewDidLoad() {
        super.viewDidLoad()
        let status:CLAuthorizationStatus = CLLocationManager.authorizationStatus()
        if status == CLAuthorizationStatus.NotDetermined{
            locationManager.requestWhenInUseAuthorization() //ios8 and later only
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

