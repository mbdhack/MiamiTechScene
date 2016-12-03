//
//  BaseClass.swift
//  MiamiTechScene
//
//  Created by davyngoma on 11/25/16.
//  Copyright © 2016 davyngoma. All rights reserved.
//

import UIKit
import SwiftyJSON
import MapKit

class BaseClass: NSObject,MKAnnotation {
    let annotation = MKPointAnnotation()
    let latDelate : CLLocationDegrees = 0.09
    let longDelat : CLLocationDegrees = 0.09
    let section = ["Bootcamp", "education"]
    let sectionItem = [[String:Any]]()
    var latitude: Double
    var longitude:Double
    var title: String?
    var subtitle: String?
    init(latitude: Double, longitude: Double) {
        self.latitude = latitude
        self.longitude = longitude
    }
    var coordinate: CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    struct Location {
        var phoneNumber: String
        var website: String
        var latitude: Double
        var longitude: Double
        var name : String
    }
    
    struct sectionItemData {
        var SchoolNameBootCamp: String
        var SchoolNameEducation: String
    }
    var coorDinates = [Location]()
    func getdatalink () {
    let path : String  = Bundle.main.path(forResource: "Data", ofType: "json") as String!
    let jsonData = NSData(contentsOfFile: path) as NSData?
    let read = JSON(data:jsonData as! Data)
    for (_ , eachcode) in read{
        let latitude = eachcode["longitude"].double
        let longitude = eachcode["latitude"].double
        let name = eachcode["name"].string
        let website = eachcode["website"].string
        let phonenumber = eachcode["phone number"].string
        coorDinates.append(Location(phoneNumber :phonenumber!,website: website!, latitude: latitude!, longitude:longitude! , name:name!))
        }
        print(coorDinates)
   
    }
}

//class GetItemByType: BaseClass {
//    override func getdatalink() {
//        for eachCode  in read {
//        
//        }
//    }


