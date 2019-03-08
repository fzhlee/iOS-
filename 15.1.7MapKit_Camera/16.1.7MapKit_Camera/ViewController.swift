//
//  ViewController.swift
//  16.1.7MapKit_Camera
//
//  Created by Jerry on 16/7/28.
//  Copyright © 2016年 www.coolketang.com. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let mapView = MKMapView(frame: self.view.bounds)
        mapView.mapType = MKMapType.standard
        
        let center = CLLocationCoordinate2DMake(39.915352, 116.397105)
        let fromEye = CLLocationCoordinate2DMake(39.915352+0.1, 116.397105+0.1)
        let altitude : CLLocationDistance = 100
        let camera = MKMapCamera(lookingAtCenter: center, fromEyeCoordinate: fromEye, eyeAltitude: altitude)
        mapView.camera = camera
        
        
        self.view.addSubview(mapView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

