//
//  BaseClass.swift
//  MiamiTechScene
//
//  Created by davyngoma on 11/25/16.
//  Copyright © 2016 davyngoma. All rights reserved.
//

import UIKit
import SwiftyJSON

class BaseClass: NSObject {
    struct Location {
        var phoneNumber: Int
        var website: String
        var latitude: Double
        var  longitude: Double
    }
    var Data = [[String:AnyObject]]()
    var coorDinates = []()
    
    func getdatalink () {
    let path : String  = Bundle.main.path(forResource: "Data", ofType: "json") as String!
    let jsonData = NSData(contentsOfFile: path) as NSData!
    let read = JSON(data:jsonData as! Data)
    for (_ , eachcode) in read["coding_schools"]{
    var  latitude = eachcode["longitude"].double
    var  longitude = eachcode["latitude"].double
    var  phone_number = eachcode["phone number"].intValue
    var  website = eachcode["website"].string
        }
    coorDinates.append(Location(phoneNumber:  phone_number, website:website , latitude: latitude, longitude: longitude))
   
    }
}


