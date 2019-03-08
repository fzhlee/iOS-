//
//  ViewController.swift
//  UIViewProject04_AffineTransform
//
//  Created by Jerry on 16/5/27.
//  Copyright © 2016年 www.coolketang.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        view.center = self.view.center
        view.backgroundColor = UIColor.black
        self.view.addSubview(view)
        
//        let transform = view.transform
//        view.transform = transform.translatedBy(x: 0, y: 100)
//        view.transform = transform.scaledBy(x: 1.5, y: 1.5)
//        view.transform = transform.rotated(by: 3.14/4)
//        view.transform.a = 1.0
//        view.transform.b = 0.5
//        view.transform.c = 0.5
//        view.transform.d = 1.0
//        view.transform.tx = 0.0
//        view.transform.ty = 0.0
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

