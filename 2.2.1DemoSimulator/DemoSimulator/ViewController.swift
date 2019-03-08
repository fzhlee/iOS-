//
//  ViewController.swift
//  DemoSimulator
//
//  Created by Jerry on 16/6/16.
//  Copyright © 2016年 coolketang.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var imageView:UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let image = UIImage(named: "Pic1")
        imageView = UIImageView(image: image)
        
        imageView.center = CGPoint(x: UIScreen.main.bounds.width/2, y: UIScreen.main.bounds.height/2)
        self.view.addSubview(imageView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

