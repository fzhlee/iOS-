//
//  ViewController.swift
//  UIViewProject03_Frame
//
//  Created by Jerry on 16/5/26.
//  Copyright © 2016年 www.coolketang.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let fisrtView = UIView(frame: CGRect(x: 20, y: 40, width: 200, height: 200))
        fisrtView.backgroundColor = UIColor.black
        
        let secondView = UIView(frame: CGRect(x: 50, y: 70, width: 200, height: 200))
        secondView.backgroundColor = UIColor.darkGray
        
        let thirdView = UIView(frame: CGRect(x: 80, y: 100, width: 200, height: 200))
        thirdView.backgroundColor = UIColor.lightGray
        
        self.view.addSubview(fisrtView)
        self.view.addSubview(secondView)
        self.view.addSubview(thirdView)
//        self.view.insertSubview(thirdView, belowSubview: secondView)
//        self.view.bringSubview(toFront: fisrtView)
//        fisrtView.removeFromSuperview()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

