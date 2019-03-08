//
//  ViewController.swift
//  UIViewProject06_CustomizedView
//
//  Created by Jerry on 16/5/27.
//  Copyright © 2016年 www.coolketang.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let view = RoundView(frame: CGRect(x: 40, y: 40, width: 240, height: 140))
        view.color = UIColor.green
        self.view.addSubview(view)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

