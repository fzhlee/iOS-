//
//  ViewController.swift
//  14.1.2PlistProject_CreatePlistFile
//
//  Created by Jerry on 16/7/17.
//  Copyright © 2016年 www.coolketang.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let dic:NSMutableDictionary = NSMutableDictionary()
        dic.setObject("Bruce", forKey: "Name" as NSCopying)
        dic.setObject(22, forKey: "Age" as NSCopying)
        
        let plistPath = Bundle.main.path(forResource: "demoPlist", ofType: "plist")
        dic.write(toFile: plistPath!, atomically: true)
        
        let data:NSMutableDictionary = NSMutableDictionary.init(contentsOfFile: plistPath!)!
        let message = data.description
        
        print(plistPath!)
        print(message)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

