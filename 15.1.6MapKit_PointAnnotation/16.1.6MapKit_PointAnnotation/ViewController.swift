//
//  ViewController.swift
//  16.1.6MapKit_PointAnnotation
//
//  Created by Jerry on 16/7/28.
//  Copyright © 2016年 www.coolketang.com. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {
    
    var selectedAnnotion : MKAnnotation!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let mapView = MKMapView(frame: self.view.bounds)
        mapView.delegate = self
        mapView.mapType = MKMapType.standard
        
        let coordinate2D = CLLocationCoordinate2D(latitude: 39.915352, longitude: 116.397105)
        let region = MKCoordinateRegionMake(coordinate2D, MKCoordinateSpanMake(0.02, 0.02))
        mapView.setRegion(region, animated: true)
        
        let objectAnnotation = MKPointAnnotation()
        objectAnnotation.coordinate = coordinate2D
        objectAnnotation.title = "故宫"
        objectAnnotation.subtitle = "世界五大宫之首"
        mapView.addAnnotation(objectAnnotation)
        
        self.view.addSubview(mapView)
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        let identifier = "annotationView"
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
        if annotationView == nil {
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: identifier)
        }
        
        let button = UIButton(type: UIButtonType.infoDark)
        button.addTarget(self, action: #selector(ViewController.showInfo), for: .touchUpInside)
        annotationView?.leftCalloutAccessoryView = button
        annotationView?.image = UIImage(named: "Annotation")
        
        self.selectedAnnotion = annotation;
        annotationView?.canShowCallout = true
        return annotationView
    }
    
    func mapView(_ mapView: MKMapView, didAdd views: [MKAnnotationView]) {
        for view in views{
            print("已添加注解视图至地图中，注解视图的标题是："+((view.annotation?.title)!)!)
        }
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        print(view.annotation?.coordinate)
        print(view.annotation?.title)
        print(view.annotation?.subtitle)
    }
    
    @objc func showInfo(sender : UIButton){
        let message = "故宫又名紫禁城，是中国乃至世界上保存最完整、规模最大的木质结构古建筑群。"
        let alertView = UIAlertController(title: self.selectedAnnotion.title!, message: message, preferredStyle: UIAlertControllerStyle.alert)
        let OKAction = UIAlertAction(title: "确认", style: .default, handler: nil)
        alertView.addAction(OKAction)
        self.present(alertView, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

