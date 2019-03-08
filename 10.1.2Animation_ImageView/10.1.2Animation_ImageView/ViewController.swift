//
//  ViewController.swift
//  10.1.2Animation_ImageView
//
//  Created by Jerry on 16/7/14.
//  Copyright © 2016年 www.coolketang.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var images = [UIImage]()
        for i in 1 ... 24
        {
            images.append(UIImage(named: "animation\(i)")!)
        }
        
        let imageView = UIImageView(frame: CGRect(x: 20, y: 60, width: 280, height: 280))
        imageView.animationImages = images
        imageView.animationDuration = 2
        imageView.animationRepeatCount = 0
        imageView.startAnimating()
        
        self.view.addSubview(imageView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

