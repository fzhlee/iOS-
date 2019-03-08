//
//  ViewController.swift
//  16.1.1MapKit_SimpleMap
//
//  Created by Jerry on 16/7/27.
//  Copyright © 2016年 www.coolketang.com. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let mapView = MKMapView(frame: self.view.bounds)
        mapView.mapType = MKMapType.standard
        mapView.showsScale = true
        mapView.showsTraffic = true
        mapView.showsPointsOfInterest = true
        
        let coordinate2D = CLLocationCoordinate2D(latitude: 39.915352, longitude: 116.397105)
        let zoomLevel = 0.02
        let region = MKCoordinateRegionMake(coordinate2D, MKCoordinateSpanMake(zoomLevel, zoomLevel))
        mapView.setRegion(region, animated: true)
        
        //缩放
//        mapView.region.span.latitudeDelta *= 1.5
//        mapView.region.span.longitudeDelta *= 1.5
        
        //平移
//        let coordinate = mapView.convert(CGPoint(x:mapView.frame.size.width/2, y:0), toCoordinateFrom: mapView)
//        mapView.setCenter(coordinate, animated: true)
        
        self.view.addSubview(mapView)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

