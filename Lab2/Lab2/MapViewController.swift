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

    let search = ViewController()
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //set location
        let location = CLLocationCoordinate2D(
            latitude: 40.006867,
            longitude: -105.266195
        )
        let span = MKCoordinateSpanMake(0.02, 0.02)
        let region = MKCoordinateRegion(center: location, span: span)
        
        mapView.setRegion(region, animated: true)
        
        
        /*
        // Set up Libraries
        */
        let norlin = CLLocationCoordinate2D(
            latitude: 40.008628,
            longitude: -105.270663
        )
        let annotation1 = MKPointAnnotation()
        annotation1.coordinate = norlin
        annotation1.title="Norlin Library"
        annotation1.subtitle="Open 7:30am to 5:00pm"
        mapView.addAnnotation(annotation1)
        
        
        let gemmill = CLLocationCoordinate2D(
            latitude: 40.007948,
            longitude: -105.264446
        )
        
        let annotation2 = MKPointAnnotation()
        annotation2.coordinate = gemmill
        annotation2.title="Gemmill Library"
        annotation2.subtitle="Open 8am to 11pm"
        mapView.addAnnotation(annotation2)
        
        
        
        /*
        // Set up Coffee Shops
        */
        let cel = CLLocationCoordinate2D(
            latitude: 40.007023,
            longitude: -105.263786
        )
        let annotation3 = MKPointAnnotation()
        annotation3.coordinate = cel
        annotation3.title="Celestial Seasonings"
        annotation3.subtitle="Open 8am to 6pm"
        mapView.addAnnotation(annotation3)
        
        
        let pekoes = CLLocationCoordinate2D(
            latitude: 40.007418,
            longitude: -105.269880
        )
        
        let annotation4 = MKPointAnnotation()
        annotation4.coordinate = pekoes
        annotation4.title="Pekoes"
        annotation4.subtitle="Open 7am to 7pm"
        mapView.addAnnotation(annotation4)
        
        
        let goat = CLLocationCoordinate2D(
            latitude: 40.008709,
            longitude: -105.270197
        )
        
        let annotation5 = MKPointAnnotation()
        annotation5.coordinate = goat
        annotation5.title="Laughing Goat"
        annotation5.subtitle="Open 8am to 11pm"
        mapView.addAnnotation(annotation5)

        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
