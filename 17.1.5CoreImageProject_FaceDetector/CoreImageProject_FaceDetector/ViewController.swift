//
//  ViewController.swift
//  DemoApp
//
//  Created by Jerry on 15/10/5.
//  Copyright © 2016年 www.coolketang.com All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor.black
        
        let image = UIImage(named: "Picture")
        let imageView = UIImageView(image: image)
        imageView.center = CGPoint(x: 160, y: 260)
        self.view.addSubview(imageView)
        
        let ciImage = CIImage(image: image!)
        let ciContext: CIContext = { return CIContext(options: nil) }()
        let ciDetector = CIDetector(ofType: CIDetectorTypeFace, context: ciContext, options: [CIDetectorAccuracy: CIDetectorAccuracyHigh])
        
        let ciImageSize = ciImage!.extent.size
        var transform = CGAffineTransform.identity
        transform = transform.scaledBy(x: 1, y: -1)
        transform = transform.translatedBy(x: 0, y: -ciImageSize.height)
        
        let features: [CIFeature]! = ciDetector!.features(in: ciImage!)
        for feature in features
        {
            let frame = feature.bounds.applying(transform)
            let faceView = UIView(frame: frame)
            faceView.layer.borderWidth = 2
            faceView.layer.borderColor = UIColor.white.cgColor
            
            imageView.addSubview(faceView)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

