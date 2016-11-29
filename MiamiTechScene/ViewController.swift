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
    var data = [BaseClass]()
    @IBOutlet weak var mapkit: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        instance.getdatalink()
        mapkit.delegate = self
        onTheMap()
    }
    
    func onTheMap() {
        for item in instance.coorDinates {
            let annotation = MKPointAnnotation()
            let schoolonecordinate = CLLocationCoordinate2D(latitude:item.latitude , longitude: item.longitude)
            let latDelate : CLLocationDegrees = 0.01
            let longDelat : CLLocationDegrees = 0.01
            let schools = MKCoordinateSpan(latitudeDelta: latDelate, longitudeDelta: longDelat)
            let region = MKCoordinateRegion(center: schoolonecordinate, span: schools)
            mapkit.setRegion(region, animated: true)
            annotation.title = item.website
            annotation.coordinate = schoolonecordinate
            mapkit.addAnnotation(annotation)
        }
        
}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

