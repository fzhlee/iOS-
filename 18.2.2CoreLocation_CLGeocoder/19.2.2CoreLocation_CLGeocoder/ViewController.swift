//
//  ViewController.swift
//  19.2.2CoreLocation_CLGeocoder
//
//  Created by Jerry on 16/7/20.
//  Copyright © 2016年 www.coolketang.com. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let geocoder = CLGeocoder()
        
        let location = CLLocation(latitude: 39.9, longitude: 116.3)
        geocoder.reverseGeocodeLocation(location){ (placeMarks:[CLPlacemark]?, error:Error?) ->Void in
            if (placeMarks?.count)! > 0
            {
                let placeMark = placeMarks?.first
                print(placeMark?.name ?? "")
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
