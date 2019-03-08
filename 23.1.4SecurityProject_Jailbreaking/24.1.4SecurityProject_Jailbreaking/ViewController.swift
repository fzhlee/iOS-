//
//  ViewController.swift
//  24.1.4SecurityProject_Jailbreaking
//
//  Created by Jerry on 16/7/22.
//  Copyright © 2016年 www.coolketang.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if isJailBroken(){
            print("您的设备已经越狱，请留意支付的安全性。")
        } else {
            print("您的设备没有越狱，可以正常使用内购功能。")
        }
    }
    
    func isJailBroken() -> Bool{
        let apps = ["/Applications/Cydia.app",
                    "/Applications/limera1n.app",
                    "/Applications/greenpois0n.app",
                    "/Applications/blackra1n.app",
                    "/Applications/blacksn0w.app",
                    "/Applications/redsn0w.app",
                    "/Applications/Absinthe.app"]
        
        for app in apps{
            if(FileManager.default.fileExists(atPath: app)){
                return true
            }
        }
        
        return false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

