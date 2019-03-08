//
//  ViewController.swift
//  CoreImageProject_UIBlurEffect
//
//  Created by Jerry on 16/6/21.
//  Copyright © 2016年 www.coolketang.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let image = UIImage(named: "Picture")
        let imageView = UIImageView(image: image)
        self.view.addSubview(imageView)
        
        let blur = UIBlurEffect(style: .light)
        let blurView = UIVisualEffectView(effect: blur)
        blurView.frame = CGRect(x: 40, y: 40, width: 200, height: 200)
        blurView.layer.cornerRadius = 30
        blurView.layer.masksToBounds = true
        imageView.addSubview(blurView)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

