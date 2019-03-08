//
//  ViewController.swift
//  UIViewProject02_clipsToBounds
//
//  Created by Jerry on 16/5/26.
//  Copyright © 2016年 www.coolketang.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 250, height: 250))
        view.backgroundColor = UIColor.black
        view.bounds = CGRect(x: -50, y: -50, width: 200, height: 200)

        
        let subView = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
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

