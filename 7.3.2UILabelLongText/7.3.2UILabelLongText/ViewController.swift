//
//  ViewController.swift
//  7.3.2UILabelLongText
//
//  Created by Jerry on 2018/3/13.
//  Copyright © 2018年 www.coolketang.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let label = UILabel(frame: CGRect(x: 10, y: 100, width: 300, height: 150))
        label.text = "Love you、think of you.love you secretly,love you eagerly,wait ,feel disappointed,try hard,lose,and feel sad,go apart,and recall.these are for sake of you.And I will regret for it."
        
        label.backgroundColor = UIColor.yellow
        label.textColor = UIColor.purple
        label.textAlignment = NSTextAlignment.left
        
        label.lineBreakMode = NSLineBreakMode.byCharWrapping
        label.numberOfLines = 0
        
        self.view.addSubview(label)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

