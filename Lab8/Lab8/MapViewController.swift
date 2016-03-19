//
//  MapViewController.swift
//  Lab8
//
//  Created by Jessie Albarian on 3/18/16.
//  Copyright © 2016 jessie. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation



class MapViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet var mapView: MKMapView!
    var locationManager = CLLocationManager()
    var annotation = MKPointAnnotation()
    
    var name = String()
    var lat = Double()
    var long = Double()
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        let location = CLLocationCoordinate2D(
            latitude: lat,
            longitude: long
        )
        let span = MKCoordinateSpanMake(0.03, 0.03)
        
//        let region = MKCoordinateRegionMake(locationManager.location!.coordinate,span)
        let region = MKCoordinateRegionMake(location, span)
        mapView.setRegion(region, animated: true)
        
        mapView.mapType=MKMapType.Standard
        let status:CLAuthorizationStatus = CLLocationManager.authorizationStatus()
        
        if status==CLAuthorizationStatus.NotDetermined{
            locationManager.requestWhenInUseAuthorization()
        }
        locationManager.delegate=self
        locationManager.desiredAccuracy=kCLLocationAccuracyBest
        locationManager.distanceFilter=kCLDistanceFilterNone
        mapView.showsUserLocation=true
        
        annotation.coordinate=location
        annotation.title = name
//        annotation.subtitle="New York"
        mapView.addAnnotation(annotation)
        super.viewDidLoad()
    }

    
    
    //called when the authorization status for the application changed.
    func locationManager(manager: CLLocationManager,
        didChangeAuthorizationStatus status: CLAuthorizationStatus) {
            print("didchangeauth")
            if status==CLAuthorizationStatus.AuthorizedWhenInUse {
                locationManager.startUpdatingLocation() //starts the location
                manager
            }
    }
    
    
    //called when a location cannot be determined
    func locationManager(manager: CLLocationManager, didFailWithError
        error: NSError) {
            var errorType=String()
            if let clError=CLError(rawValue: error.code) {
                if clError == .Denied {
                    errorType="access denied"
                    let alert=UIAlertController(title: "Error", message: errorType, preferredStyle: UIAlertControllerStyle.Alert)
                    let okAction:UIAlertAction=UIAlertAction(title: "OK", style:UIAlertActionStyle.Default, handler: nil)
                    alert.addAction(okAction)
                    presentViewController(alert, animated: true, completion:
                        nil)
                }
            }
    }
    
    
    //called when a new location value is available
//    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
//        let span = MKCoordinateSpanMake(0.05, 0.05)
//        let region = MKCoordinateRegionMake(manager.location!.coordinate,span)
//        mapView.setRegion(region, animated: true)
//    }
//
    
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
