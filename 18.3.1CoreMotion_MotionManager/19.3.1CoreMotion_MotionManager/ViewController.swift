//
//  ViewController.swift
//  19.3.1CoreMotion_MotionManager
//
//  Created by Jerry on 16/7/20.
//  Copyright © 2016年 www.coolketang.com. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {
    
    var motionManager:CMMotionManager!
    var label:UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        label = UILabel(frame: CGRect(x: 40, y: 80, width: 240, height: 90))
        label.text = "Waiting"
        label.backgroundColor = UIColor.orange
        label.numberOfLines = 3;
        self.view.addSubview(label)
        
        motionManager = CMMotionManager()
        motionManager.accelerometerUpdateInterval = 0.1
        
        if motionManager.isAccelerometerAvailable{
            motionManager.startAccelerometerUpdates(to: OperationQueue.main, withHandler: { (accelerometerData:CMAccelerometerData?, error:Error?) -> Void in
                
                if error != nil{
                    self.motionManager.stopAccelerometerUpdates()
                }
                else{
                    var message = ""
                    message += "X:\(accelerometerData!.acceleration.x)\n"
                    message += "Y:\(accelerometerData!.acceleration.y)\n"
                    message += "Z:\(accelerometerData!.acceleration.z)"
                    
                    self.label.text = message
                }
            })
        }
        else{
            print("您的设置不支持加速计")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

