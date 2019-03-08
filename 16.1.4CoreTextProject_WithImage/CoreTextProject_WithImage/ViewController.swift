//
//  ViewController.swift
//  CoreTextProject_WithImage
//
//  Created by Jerry on 16/6/23.
//  Copyright © 2016年 www.coolketang.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let imageView = CTImageView()
        imageView.frame = CGRect(x: 20, y: 80, width: 280, height: 280)
        self.view.addSubview(imageView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

