//
//  MapViewController.swift
//  ProjectOne
//
//  Created by Jessie Albarian on 4/13/16.
//  Copyright © 2016 babyllama. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController {

    
    @IBOutlet var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // BOULDER HUMANE SOCIETY
        
        
        
        let boulder = CLLocationCoordinate2D(
            latitude: 40.014986,
            longitude: -105.270546
        )
        
        let span = MKCoordinateSpanMake(0.05, 0.05)
        let region = MKCoordinateRegion(center: boulder, span: span)
        mapView.setRegion(region, animated: true)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = boulder
        annotation.title = "Boulder Humane Society"
        annotation.subtitle = "303-415-0685"
        mapView.addAnnotation(annotation)
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
