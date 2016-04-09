//
//  MapViewController.swift
//  ProjectTwo
//
//  Created by Jessie Albarian on 4/9/16.
//  Copyright © 2016 babyllama. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation




class MapViewController: UIViewController {

    @IBOutlet var mapView: MKMapView!
    
    override func viewDidLoad() {
        let location = CLLocationCoordinate2D(
            latitude: 35.746512,
            longitude: -39.462891
        )
//        let paris = CLLocationCoordinate2D(
//            latitude: 35.746512,
//            longitude: -39.462891
//        )
//        let london = CLLocationCoordinate2D(
//            latitude: 35.746512,
//            longitude: -39.462891
//        )
//        let colorado = CLLocationCoordinate2D(
//            latitude: 35.746512,
//            longitude: -39.462891
//        )
//        let utah = CLLocationCoordinate2D(
//            latitude: 35.746512,
//            longitude: -39.462891
//        )
        
        let span = MKCoordinateSpanMake(100, 100)
        let region = MKCoordinateRegion(center: location, span: span)
        mapView.setRegion(region, animated: true)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate=location
        annotation.title="Empire State Building"
        annotation.subtitle="New York"
        mapView.addAnnotation(annotation)
        super.viewDidLoad()
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
