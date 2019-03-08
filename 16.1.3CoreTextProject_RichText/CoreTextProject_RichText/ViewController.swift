//
//  ViewController.swift
//  CoreTextProject_RichText
//
//  Created by Jerry on 16/6/22.
//  Copyright © 2016年 www.coolketang.com. All rights reserved.
//

import UIKit
import CoreText

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        let label = UILabel(frame: CGRect(x: 10, y: 60, width: 300, height: 40))
        let string = NSMutableAttributedString(string: "Interactive tutorials for Xcode")
        
        let font = CTFontCreateWithName(("CourierNewPS-BoldMT" as CFString?)!, 22, nil)
        string.addAttribute(NSAttributedStringKey(rawValue: kCTFontAttributeName as String), value: font, range: NSRange(location: 0, length: 11))
        
        var number = 3
        let cfNumber = CFNumberCreate(kCFAllocatorDefault, CFNumberType.sInt8Type, &number)
        string.addAttribute(NSAttributedStringKey(rawValue: kCTStrokeWidthAttributeName as String), value: cfNumber!, range: NSMakeRange(12, 9))
        
        let italicFont = UIFont.italicSystemFont(ofSize: 14)
        let fontValue = CTFontCreateWithName((italicFont.fontName as CFString?)!, 14, nil)
        string.addAttribute(NSAttributedStringKey(rawValue: kCTFontAttributeName as String), value: fontValue, range: NSRange(location: 22, length: 3))
        
        string.addAttribute(NSAttributedStringKey(rawValue: kCTUnderlineStyleAttributeName as String), value: NSNumber(value: 1), range: NSRange(location: 26, length: 5))
        
        label.attributedText = string
        self.view.addSubview(label)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
