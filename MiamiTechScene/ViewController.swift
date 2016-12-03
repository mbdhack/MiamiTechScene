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
    var identifierString = "identifier"
    var iconPictureRight = "Info-48"
    
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
        tabBarController?.tabBar.barTintColor = UIColor.purple
        self.tabBarItem.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0);
        self.title = nil;
        navigationController?.navigationBar.barTintColor = UIColor.purple
        setUIbarButtonWithImage (imagename : iconPictureRight)
        // let info1 = customPointAnotation()
        //info1.pinCustomImageName = "annotation_pin"
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
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if !(annotation is customPointAnotation) {
            return nil
        }
        let reuseId = "test"
        var anView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseId)
        if anView == nil {
            anView = MKAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
        }
        else {
            anView?.annotation = annotation
        }
        anView?.image = UIImage(named:"annotation_pin")
        anView?.backgroundColor = UIColor.clear
        anView?.canShowCallout = true
        return anView
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

