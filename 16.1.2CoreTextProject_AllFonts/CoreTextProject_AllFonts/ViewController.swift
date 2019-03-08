//
//  ViewController.swift
//  CoreTextProject_AllFonts
//
//  Created by Jerry on 16/6/22.
//  Copyright © 2016年 www.coolketang.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        for familyName in UIFont.familyNames
        {
            print("\n[\(familyName)]")
            for font in UIFont.fontNames(forFamilyName: familyName)
            {
                print("\t\(font)")
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
