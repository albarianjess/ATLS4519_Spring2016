
import Foundation


class Places {
    var name: String
    var latitude: Double
    var longitude: Double
    
    init(newlat: Double, newlong: Double, newname: String){
        name = newname
        latitude = newlat
        longitude = newlong
    }
}