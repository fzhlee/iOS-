//
//  ViewController.swift
//  7.2.3UIButtonTargetAction
//
//  Created by Jerry on 2018/3/12.
//  Copyright © 2018年 www.coolketang.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let button = UIButton(type: UIButtonType.roundedRect)
        button.frame = CGRect(x: 20, y: 100, width: 280, height: 44)
        button.backgroundColor = UIColor.purple
        button.tintColor = UIColor.yellow
        button.setTitle("Tap Me", for: .normal)
        button.addTarget(self, action: #selector(ViewController.buttonTapped(_:)), for: UIControlEvents.touchUpInside)
        self.view.addSubview(button)
    }

    @objc func buttonTapped(_ button:UIButton)
    {
        button.setTitle("The button is tapped.", for: .normal)
        button.isEnabled = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

