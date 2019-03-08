//
//  ViewController.swift
//  24.1.2SecurityProject_SHA1
//
//  Created by Jerry on 16/7/22.
//  Copyright © 2016年 www.coolketang.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let str = "coolketang.com"
        print("加密结果："+str.SHA1())
        print("密文长度：\(str.SHA1().lengthOfBytes(using: String.Encoding.utf8))")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

