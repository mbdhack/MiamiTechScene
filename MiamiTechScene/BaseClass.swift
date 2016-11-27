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
    var schoolName = [[String:AnyObject]]()
    var Data = [[String:AnyObject]]()
    var latitudeArray: [Double] = []
    var longitudeArray: [Double] = []
    var coorDinates = [[Double]]()
    var schoolNameLogitude = [[String:AnyObject]]()
    var schoolNameLatitude = [[String:AnyObject]]()
    func getdatalink () {
    let path : String  = Bundle.main.path(forResource: "Data", ofType: "json") as String!
    let jsonData = NSData(contentsOfFile: path) as NSData!
    let read = JSON(data:jsonData as! Data)
    for (_ , eachcode) in read["coding_schools"]{
    let  latitude = eachcode["longitude"].double
    let  longitude = eachcode["latitude"].double
    latitudeArray.append(latitude!)
    longitudeArray.append(longitude!)
        }
    coorDinates.append(latitudeArray)
    coorDinates.append(longitudeArray)
    }
}


