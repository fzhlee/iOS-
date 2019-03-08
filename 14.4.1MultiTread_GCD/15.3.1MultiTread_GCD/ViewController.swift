//
//  ViewController.swift
//  15.3.1MultiTread_GCD
//
//  Created by Jerry on 16/7/26.
//  Copyright © 2016年 www.coolketang.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var label = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        label.frame = CGRect(x: 0, y: 0, width: 320, height: 568)
        label.text = "Loading..."
        label.font = UIFont(name: "Arial", size: 24)
        label.backgroundColor = UIColor.orange
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        self.view.addSubview(label)
        
//        let apiURL = URL(string: "http://ip.taobao.com/service/getIpInfo.php?ip=27.156.152.57")
//        
//        let globalQueue = DispatchQueue.global()
//        globalQueue.async{
//            let result = try? Data(contentsOf: apiURL!)
//            let message  = String(data: result!, encoding: String.Encoding.utf8)
//            DispatchQueue.main.async
//            {
//                self.label.text = message
//            }
//        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

