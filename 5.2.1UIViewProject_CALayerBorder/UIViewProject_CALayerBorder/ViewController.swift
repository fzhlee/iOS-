//
//  ViewController.swift
//  UIViewProject_CALayerBorder
//
//  Created by Jerry on 16/5/27.
//  Copyright © 2016年 www.coolketang.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let view = UIView(frame: CGRect(x: 60, y: 60, width: 200, height: 200))
        view.backgroundColor = UIColor.black
        view.layer.borderWidth = 20
        view.layer.borderColor = UIColor.lightGray.cgColor
        
        self.view.addSubview(view)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
