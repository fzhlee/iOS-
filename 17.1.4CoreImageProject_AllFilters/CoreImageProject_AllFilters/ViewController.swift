//
//  ViewController.swift
//  CoreImageProject_AllFilters
//
//  Created by Jerry on 16/6/21.
//  Copyright © 2016年 www.coolketang.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let buildInFilters = CIFilter.filterNames(inCategory: kCICategoryBuiltIn)
        for filter in buildInFilters
        {
            let filter = CIFilter(name: filter as String)
            let attributes = filter?.attributes
            print("[\(String(describing: filter))]\n")
            print(attributes!)
            print("\n -------------------------- \n")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

