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
import Firebase




var datas = [Location]()

class MapViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet var mapView: MKMapView!
    
    let ref = Firebase(url: "https://mypersonalsite.firebaseio.com/")
    
    
    
    
    //---------------
    // VIEW DID LOAD
    //---------------
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    
    //----------------------
    // SET LOCATION POINTERS
    //----------------------
    func setLocations(){
        let location = CLLocationCoordinate2D(
            latitude: 35.746512,
            longitude: -39.462891
        )
        
        let span = MKCoordinateSpanMake(100, 100)
        let region = MKCoordinateRegion(center: location, span: span)
        mapView.setRegion(region, animated: true)
        
        
        
        for item in datas{
            let point = CLLocationCoordinate2D(
                latitude: item.lat,
                longitude: item.long
            )
            let annotation = MKPointAnnotation()
            annotation.coordinate = point
            annotation.title = item.name.uppercaseString
            mapView.addAnnotation(annotation)
        }

    }
    
    
    
    //-------------------
    // GETS FIREBASE DATA
    //-------------------
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        ref.observeEventType(FEventType.Value, withBlock: {snapshot in
            datas=[]
            if let snapshots = snapshot.children.allObjects as?
                [FDataSnapshot]{
                for item in snapshots {
                    guard let lat = item.value["latitude"] as? CLLocationDegrees,
                        let long = item.value["longitude"] as? CLLocationDegrees
                        else {
                            continue
                    }
                    let newLocation = Location(newname: item.key, newlat: lat, newlong: long)
                    datas.append(newLocation)
                }
            }
            self.setLocations()
//            self.mapView.reloadInputViews()

        })

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
