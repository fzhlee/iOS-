//
//  OptionLabel.swift
//  DemoApp
//
//  Created by Jerry on 2018/1/29.
//  Copyright © 2018年 www.coolketang.com. All rights reserved.
//

import UIKit

class OptionLabel: UILabel {

    open var isActive: Bool {
        didSet {
            self.textColor = isActive == true ? .orange : UIColor(red: 55/255, green: 55/255, blue: 55/255, alpha: 1.0)
        }
    }
    
    override init(frame: CGRect) {
        self.isActive = false
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.isActive = false
        super.init(coder: aDecoder)
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
