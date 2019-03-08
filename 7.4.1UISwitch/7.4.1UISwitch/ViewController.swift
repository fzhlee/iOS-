//
//  ViewController.swift
//  7.4.1UISwitch
//
//  Created by Jerry on 2018/3/13.
//  Copyright © 2018年 www.coolketang.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let rect = CGRect(x: 130, y: 100, width: 0, height: 0)
        let uiSwitch = UISwitch(frame: rect)
        uiSwitch.tintColor = .brown
        uiSwitch.thumbTintColor = .purple
        uiSwitch.onTintColor = .orange
        uiSwitch.setOn(true, animated: true)
        uiSwitch.addTarget(self, action: #selector(ViewController.switchChanged(_:)), for:
            UIControlEvents.valueChanged)
        
        self.view.addSubview(uiSwitch)
    }

    @objc func switchChanged(_ uiSwitch:UISwitch)
    {
        var message = "Turn on the switch."
        if(!uiSwitch.isOn)
        {
            message = "Turn off the switch."
        }
        print(message)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

