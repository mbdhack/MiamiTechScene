//
//  ViewController.swift
//  MiamiTechScene
//
//  Created by davyngoma on 11/25/16.
//  Copyright © 2016 davyngoma. All rights reserved.
//

import UIKit
import SwiftyJSON
import MapKit

class ViewController: UIViewController ,MKMapViewDelegate {
    var instance = BaseClass()
    var data = [Data]()
    @IBOutlet weak var mapkit: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
     // instance.getdatalink()
        instance.getdatalink()
        mapkit.delegate = self
        data.append(instance.coorDinates)
        print(data)
        
    }
    
//    func onTheMap() {
//        for item in instance.coorDinates {
//         let schoolonecordinate = CLLocationCoordinate2D(latitude:instance. , longitude: CLLocationDegrees)
//        
//        }
////         let schoolonecordinate = CLLocationCoordinate2D(latitude: , longitude: <#T##CLLocationDegrees#>)
//        //span
//        let latDelate : CLLocationDegrees = 0.01
//        let longDelat : CLLocationDegrees = 0.01
//        
//    
   // }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

