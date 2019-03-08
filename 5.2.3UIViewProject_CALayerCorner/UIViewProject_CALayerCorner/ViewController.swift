//
//  ViewController.swift
//  UIViewProject_CALayerCorner
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
        view.layer.cornerRadius = 200
        view.layer.masksToBounds = true
        
        let subView = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 100))
        subView.backgroundColor = UIColor.gray
        
        view.addSubview(subView)
        self.view.addSubview(view)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

