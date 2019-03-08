//
//  ViewController.swift
//  UIAutomationProject_Demo
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
        view.backgroundColor = UIColor.brownColor()
        self.view.addSubview(view)
        
        let btAdd = UIButton(frame: CGRect(x: 30, y: 350, width: 80, height: 30))
        btAdd.backgroundColor = UIColor.grayColor()
        btAdd.setTitle("Add", forState: .Normal)
        btAdd.addTarget(self, action: #selector(ViewController.addView), forControlEvents: .TouchUpInside)
        self.view.addSubview(btAdd)
        
        let btBack = UIButton(frame: CGRect(x: 120, y: 350, width: 80, height: 30))
        btBack.backgroundColor = UIColor.grayColor()
        btAdd.setTitle("Switch", forState: .Normal)
        btAdd.addTarget(self, action: #selector(ViewController.bringViewBack), forControlEvents: .TouchUpInside)
        self.view.addSubview(btBack)
        
        let btRemove = UIButton(frame: CGRect(x: 210, y: 350, width: 80, height: 30))
        btRemove.backgroundColor = UIColor.grayColor()
        btAdd.setTitle("Remove", forState: .Normal)
        btAdd.addTarget(self, action: #selector(ViewController.removeView), forControlEvents: .TouchUpInside)
        self.view.addSubview(btRemove)
    }
    
    func addView(_ :UIButton!)
    {
        let rect = CGRect(x: 60, y: 90, width: 200, height: 200)
        let view = UIView(frame: rect)
        view.backgroundColor = UIColor.purpleColor()
        view.tag = 1
        
        self.view.addSubview(view)
    }
    
    func bringViewBack(_ :UIButton!)
    {
        let view = self.view.viewWithTag(1)
        self.view.sendSubviewToBack(view!)
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

