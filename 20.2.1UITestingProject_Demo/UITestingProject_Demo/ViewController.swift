//
//  ViewController.swift
//  UITestingProject_Demo
//
//  Created by Jerry on 16/6/25.
//  Copyright © 2016年 www.coolketang.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let rect = CGRect(x: 30, y: 50, width: 200, height: 200)
        let view = UIView(frame: rect)
        view.backgroundColor = UIColor.brown
        self.view.addSubview(view)
        
        let btAdd = UIButton(frame: CGRect(x: 30, y: 350, width: 80, height: 30))
        btAdd.backgroundColor = UIColor.gray
        btAdd.setTitle("Add", for: UIControlState())
        btAdd.addTarget(self, action: #selector(ViewController.addView(_:)), for: UIControlEvents.touchUpInside)
        self.view.addSubview(btAdd)
        
        let btBack = UIButton(frame: CGRect(x: 120, y: 350, width: 80, height: 30))
        btBack.backgroundColor = UIColor.gray
        btBack.setTitle("Switch", for: UIControlState())
        btBack.addTarget(self, action: #selector(ViewController.bringViewBack(_:)), for: UIControlEvents.touchUpInside)
        self.view.addSubview(btBack)
        
        let btRemove = UIButton(frame: CGRect(x: 210, y: 350, width: 80, height: 30))
        btRemove.backgroundColor = UIColor.gray
        btRemove.setTitle("Remove", for: UIControlState())
        btRemove.addTarget(self, action: #selector(ViewController.removeView(_:)), for: UIControlEvents.touchUpInside)
        self.view.addSubview(btRemove)
    }
    
    func addView(_ :UIButton!)
    {
        let rect = CGRect(x: 60, y: 90, width: 200, height: 200)
        let view = UIView(frame: rect)
        view.backgroundColor = UIColor.purple
        view.tag = 1
        
        self.view.addSubview(view)
    }
    
    func bringViewBack(_ :UIButton!)
    {
        let view = self.view.viewWithTag(1)
        self.view.sendSubview(toBack: view!)
    }
    
    func removeView(_ :UIButton!)
    {
        let view = self.view.viewWithTag(1)
        view?.removeFromSuperview()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

