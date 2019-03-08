//
//  ViewController.swift
//  7.1.1UIButton控件
//
//  Created by Jerry on 2018/3/12.
//  Copyright © 2018年 www.coolketang.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let buttonTypes : [UIButtonType] = [.system, .contactAdd, .detailDisclosure, .infoDark, .infoLight,.roundedRect]
        
        for i in 0 ..< buttonTypes.count
        {
            let button = UIButton(type: buttonTypes[i])
            button.frame = CGRect(x: 100, y: 50 + i*50, width: 120, height: 30)
            if i == 0 || i == 5
            {
                button.setTitle("Button \(i+1)", for: .normal)
            }
            self.view.addSubview(button)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

