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
    
    @IBOutlet weak var mapkit: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
     // instance.getdatalink()
        instance.getdatalink()
        mapkit.delegate = self
        
    }
    
    func onTheMap() {
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

