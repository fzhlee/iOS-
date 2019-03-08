//
//  ViewController.swift
//  16.1.4MapKit_Delegate
//
//  Created by Jerry on 16/7/28.
//  Copyright © 2016年 www.coolketang.com. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let mapView = MKMapView(frame: self.view.bounds)
        mapView.delegate = self
        mapView.mapType = MKMapType.standard
        
        let coordinate2D = CLLocationCoordinate2D(latitude: 39.915352, longitude: 116.397105)
        let region = MKCoordinateRegionMake(coordinate2D, MKCoordinateSpanMake(0.02, 0.02))
        mapView.setRegion(region, animated: true)
        
        self.view.addSubview(mapView)
    }
    
    func mapView(_ mapView: MKMapView, regionWillChangeAnimated animated: Bool) {
        print("当前方法为：regionWillChange")
    }
    
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        print("当前方法为：regionDidChange")
    }
    
    func mapViewWillStartLoadingMap(_ mapView: MKMapView) {
        print("当前方法为：mapViewWillStartLoadingMap")
    }
    
    func mapViewWillStartRenderingMap(_ mapView: MKMapView) {
        print("当前方法为：mapViewWillStartRenderingMap")
    }
    
    func mapViewDidFinishLoadingMap(_ mapView: MKMapView) {
        print("当前方法为：mapViewDidFinishLoadingMap")
    }
    
    func mapViewDidFinishRenderingMap(_ mapView: MKMapView, fullyRendered: Bool) {
        print("当前方法为：mapViewDidFinishRenderingMap")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

