//
//  SubmitAnswerButton.swift
//  DemoApp
//
//  Created by Jerry on 2018/1/29.
//  Copyright © 2018年 www.coolketang.com. All rights reserved.
//

import UIKit

class SubmitAnswerButton: UIButton {

    open var canSubmit: Bool = false {
        didSet {
            //self.titleLabel?.textColor = isEnabled == true ? .white : UIColor(red: 55/255, green: 55/255, blue: 55/255, alpha: 1.0)
            self.backgroundColor = canSubmit == true ? .orange : UIColor(red: 200/255, green: 200/255, blue: 200/255, alpha: 1.0)
        }
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
