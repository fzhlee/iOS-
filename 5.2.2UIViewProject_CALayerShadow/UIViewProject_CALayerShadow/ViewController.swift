//
//  ViewController.swift
//  UIViewProject_CALayerShadow
//
//  Created by Jerry on 16/5/28.
//  Copyright © 2016年 www.coolketang.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let view = UIView(frame: CGRect(x: 60, y: 60, width: 200, height: 200))
        view.backgroundColor = UIColor.black
        
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 10.0, height: 10.0)
        view.layer.shadowOpacity = 0.45
        view.layer.shadowRadius = 5.0
        
        self.view.addSubview(view)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

