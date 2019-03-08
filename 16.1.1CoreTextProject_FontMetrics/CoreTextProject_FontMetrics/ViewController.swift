//
//  ViewController.swift
//  CoreTextProject_FontMetrics
//
//  Created by Jerry on 16/6/22.
//  Copyright © 2016年 www.coolketang.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let font = UIFont.systemFont(ofSize: 24)
        print("font.ascender: \(font.ascender)")
        print("font.descender: \(font.descender)")
        print("font.capHeight: \(font.capHeight)")
        print("font.xHeight: \(font.xHeight)")
        print("font.lineHeight: \(font.lineHeight)")
        print("font.leading: \(font.leading)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

