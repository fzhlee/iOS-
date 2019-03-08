//
//  ViewController.swift
//  7.2.2UIButtonState
//
//  Created by Jerry on 2018/3/12.
//  Copyright © 2018年 www.coolketang.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let titleStates : [String] = ["正常状态", "高亮状态", "选中状态" ,"失效状态"]
        let buttonStates : [UIControlState] = [.normal, .highlighted, .selected, .disabled]
        
        let button1 = UIButton(type: .system)
        button1.frame = CGRect(x: 80, y: 50, width: 140, height: 30)
        button1.setTitle(titleStates[0], for: buttonStates[0])
        button1.setBackgroundImage(UIImage(named:"btNormal"), for: UIControlState.normal)
        self.view.addSubview(button1)
        
        let button2 = UIButton(type: .system)
        button2.frame = CGRect(x: 80, y: 100, width: 140, height: 30)
        button2.setTitle(titleStates[1], for: buttonStates[1])
        button2.setBackgroundImage(UIImage(named:"btHighlighted"), for: UIControlState.highlighted)
        button2.isHighlighted = true
        self.view.addSubview(button2)
        
        let button3 = UIButton(type: .system)
        button3.frame = CGRect(x: 80, y: 150, width: 140, height: 30)
        button3.setTitle(titleStates[2], for: buttonStates[2])
        button3.setBackgroundImage(UIImage(named:"btSelected"), for: UIControlState.selected)
        button3.isSelected = true
        self.view.addSubview(button3)
        
        let button4 = UIButton(type: .system)
        button4.frame = CGRect(x: 80, y: 200, width: 140, height: 30)
        button4.setTitle(titleStates[3], for: buttonStates[3])
        button4.setBackgroundImage(UIImage(named:"btDisabled"), for: UIControlState.disabled)
        button4.isEnabled = false
        self.view.addSubview(button4)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

