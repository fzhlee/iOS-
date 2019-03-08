//
//  ViewController.swift
//  DemoApp
//
//  Created by Jerry on 17/7/20.
//  Copyright © 2017 www.coolketang.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let lbl = UILabel(frame: self.view.frame)
        
        if #available(iOS 11.0, *)
        {
            lbl.backgroundColor = UIColor(named: "BackgroundColor")
            lbl.textColor = UIColor(named:"ForegroundColor")
        }
        
        lbl.text = "www.coolketang.com"
        lbl.font = UIFont.boldSystemFont(ofSize: 24)
        lbl.textAlignment = .center
        
        self.view.addSubview(lbl)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
