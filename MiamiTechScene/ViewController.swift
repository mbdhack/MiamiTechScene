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
    var instance = BaseClass(latitude: 0.0, longitude: 0.0)
    let info1 = customPointAnotation()
    var pointAnnotation:customPointAnotation!
    
    @IBOutlet weak var swicthMapType: UISegmentedControl!
    @IBOutlet weak var mapkit: MKMapView! {
        didSet {
          mapkit.delegate = self
        }
    }
    // MARK: - View  Delate
    override func viewDidLoad() {
        super.viewDidLoad()
        instance.getdatalink()
        onTheMap()
       // tabBarController?.tabBar.barTintColor = UIColor.white
        self.tabBarItem.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0);
        self.title = nil;
//        navigationController?.navigationBar.barTintColor = UIColor.init(red: 0.212, green: 0.271, blue: 0.612, alpha: 10.00)
//        tabBarController?.tabBar.barTintColor = UIColor.init(red: 0.212, green: 0.271, blue: 0.612, alpha: 1.00)
        setUIbarButtonWithImage (imagename : iconPictureRight)
    }
    // MARK: - Mapkit Delegate
    func onTheMap() {
        for item in instance.coorDinates {
            instance = BaseClass(latitude: item.latitude, longitude: item.longitude)
            let schoolonecordinate = instance.coordinate
            let schools = MKCoordinateSpan(latitudeDelta: instance.latDelate, longitudeDelta: instance.longDelat)
            let region = MKCoordinateRegion(center: schoolonecordinate, span: schools)
            mapkit.setRegion(region, animated: true)
            instance.annotation.title = item.name
            instance.annotation.coordinate = schoolonecordinate
            mapkit.addAnnotation(instance.annotation)
            }
        }
    func setUIbarButtonWithImage (imagename : String) {
        let button: UIButton = UIButton(type: .custom)
        button.setImage(UIImage(named: imagename), for: UIControlState.normal)
        button.frame = CGRect(x: 5, y: 5, width: 30, height: 30)
        let barButton = UIBarButtonItem(customView: button)
        self.navigationItem.rightBarButtonItem = barButton
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func performSegue(withIdentifier identifier: String, sender: Any?) {
        
    }
    // MARK: - Button Action
    @IBAction func swicthMapTypeAction(_ sender: UISegmentedControl) {
        switch (sender.selectedSegmentIndex)
        {
        case 0:
           mapkit.mapType = .standard
        case 1:
           mapkit.mapType = .satellite
        default:
           mapkit.mapType = .hybrid
        }
    }

}

