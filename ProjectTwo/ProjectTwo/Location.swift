//
//  Location.swift
//  ProjectTwo
//
//  Created by Jessie Albarian on 4/9/16.
//  Copyright © 2016 babyllama. All rights reserved.
//

import Foundation
import MapKit
import CoreLocation

class Location {
    var name: String
    var lat: CLLocationDegrees
    var long: CLLocationDegrees
    
    init(newname: String, newlat: CLLocationDegrees, newlong: CLLocationDegrees){
        name = newname
        lat = newlat
        long = newlong
    }
}