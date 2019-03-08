//
//  ViewController.swift
//  7.3.3UILabelAttributedText
//
//  Created by Jerry on 2018/3/13.
//  Copyright © 2018年 www.coolketang.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let attributedText = NSMutableAttributedString(string:"coolketang.com")
        attributedText.addAttribute(NSAttributedStringKey.font,
                                     value: UIFont.boldSystemFont(ofSize: 48),
                                     range: NSMakeRange(0,4))
        attributedText.addAttribute(NSAttributedStringKey.foregroundColor, value: UIColor.purple,
                                     range: NSMakeRange(4, 7))
        attributedText.addAttribute(NSAttributedStringKey.backgroundColor, value: UIColor.orange,
                                     range: NSMakeRange(11,3))
        
        let rect = CGRect(x: 20, y: 100, width: 280, height: 60)
        let label = UILabel(frame: rect)
        label.attributedText = attributedText
        
        self.view.addSubview(label)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

