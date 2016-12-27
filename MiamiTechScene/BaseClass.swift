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
        var typeSchool : String
        var description : String
    }
    var coorDinates = [Location]()
    var educationArray = [Location]()
    var bootcampArray = [Location]()
    var generalArray = [Location]()
    func getdatalink () {
    let path : String  = Bundle.main.path(forResource: "Data", ofType: "json") as String!
    let jsonData = NSData(contentsOfFile: path) as NSData?
    let read = JSON(data:jsonData as! Data)
    for (_ , eachcode) in read{
        let test = "ed"
        let latitude = eachcode["longitude"].double
        let longitude = eachcode["latitude"].double
        let name = eachcode["name"].string
        let website = eachcode["website"].string
        let phonenumber = eachcode["phone number"].string
        let typeSchool = eachcode["type"].string
        let description = eachcode["Description"].string
        coorDinates.append(Location(phoneNumber :phonenumber!,website: website!, latitude: latitude!, longitude:longitude! , name:name!,typeSchool:typeSchool! , description : description!))
        if (typeSchool?.contains(test))!{
        educationArray.append(Location(phoneNumber :phonenumber!,website: website!, latitude: latitude!, longitude:longitude! , name:name!,typeSchool:typeSchool! , description : description!))}
    else{bootcampArray.append(Location(phoneNumber :phonenumber!,website: website!, latitude: latitude!, longitude:longitude! , name:name!,typeSchool:typeSchool!, description : description!))}
        }
        
        generalArray += educationArray
        generalArray += bootcampArray
        generalArray.sort{
        $0.name < $1.name
        }
      //  print(generalArray)

    }
}

