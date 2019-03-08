//
//  ViewController.swift
//  14.1.1PlistProject_ReadPlistFile
//
//  Created by Jerry on 16/7/17.
//  Copyright © 2016年 www.coolketang.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let plistPath = Bundle.main.path(forResource: "demoPlist", ofType: "plist")
        let data:NSMutableDictionary = NSMutableDictionary.init(contentsOfFile: plistPath!)!
        let message = data.description
        let name = data["Name"] as! String
        let age = data["Age"] as! Int
        
        print(message)
        print(name)
        print(age)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

