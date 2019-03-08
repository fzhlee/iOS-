//
//  ViewController.swift
//  7.3.1UILabel
//
//  Created by Jerry on 2018/3/13.
//  Copyright © 2018年 www.coolketang.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let label = UILabel(frame: CGRect(x: 20, y: 100, width: 280, height: 80))
        label.text = "Hello, Xcode and Swift!"
        label.font = UIFont(name: "Arial", size: 24)
        
        label.textAlignment = NSTextAlignment.right
        label.textColor = UIColor.purple
        label.backgroundColor = UIColor.yellow
        
        label.shadowColor = UIColor.lightGray
        label.shadowOffset = CGSize(width: 2, height: 2)
        
        self.view.addSubview(label)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

