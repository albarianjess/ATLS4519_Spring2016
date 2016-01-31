//
//  MapViewController.swift
//  Lab2
//
//  Created by Jessie Albarian on 1/30/16.
//  Copyright © 2016 babyllama. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation


class MapViewController: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!

    
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let location = CLLocationCoordinate2D(
            latitude: 40.007740,
            longitude: -105.255533
        )
        
        let span = MKCoordinateSpanMake(0.02, 0.02)
        let region = MKCoordinateRegion(center: location, span: span)
        
        mapView.setRegion(region, animated: true)
        let annotation = MKPointAnnotation()
        
        annotation.coordinate=location
        annotation.title="Empire State Building"
        annotation.subtitle="New York"
        mapView.addAnnotation(annotation)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
