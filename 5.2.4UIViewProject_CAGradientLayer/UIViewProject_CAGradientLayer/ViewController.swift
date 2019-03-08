//
//  ViewController.swift
//  UIViewProject_CAGradientLayer
//
//  Created by Jerry on 16/5/28.
//  Copyright © 2016年 www.coolketang.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let rect = CGRect(x: 20, y: 60, width: 240, height: 240)
        let gradientView = UIView(frame: rect)
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = gradientView.frame
        
        let fromColor = UIColor.yellow.cgColor
        let midColor = UIColor.blue.cgColor
        let toColor = UIColor.red.cgColor
        
        gradientLayer.colors = [fromColor, midColor, toColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        gradientLayer.locations = [0, 0.3, 1]
        
        gradientView.layer.addSublayer(gradientLayer)
        self.view.addSubview(gradientView)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
