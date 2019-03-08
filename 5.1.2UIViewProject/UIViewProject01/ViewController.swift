//
//  ViewController.swift
//  UIViewProject01
//
//  Created by Jerry on 16/5/26.
//  Copyright © 2016年 www.coolketang.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let view = UIView(frame: CGRect(x: 40, y: 80, width: 240, height: 240))
//        let image = UIImage(named: "Sample")
//        view.backgroundColor = UIColor.init(patternImage: image!)
        
        view.backgroundColor = UIColor.black
//        view.alpha = 0.3
//        view.isHidden = true
        let subView = UIView(frame: CGRect(x: 40, y: 40, width: 240, height: 240))
        subView.backgroundColor = UIColor.brown
        view.addSubview(subView)
        view.clipsToBounds = true
        
        self.view.addSubview(view)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

