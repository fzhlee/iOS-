//
//  ViewController.swift
//  UIViewProject_Touch
//
//  Created by Jerry on 16/5/26.
//  Copyright © 2016年 www.coolketang.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let touchView = UIView(frame: CGRect(x: 60, y: 60, width: 200, height: 200))
        touchView.backgroundColor = UIColor.black
        self.view.addSubview(touchView)
        
        let guesture = UITapGestureRecognizer(target: self, action: #selector(ViewController.SingleTap))
        touchView.addGestureRecognizer(guesture)
    }
    
    @objc func SingleTap()
    {
        print("You touched me.")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

