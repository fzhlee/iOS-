//
//  QuestionTitleLabel.swift
//  DemoApp
//
//  Created by Jerry on 2018/1/29.
//  Copyright © 2018年 www.coolketang.com. All rights reserved.
//

import UIKit

enum QuestionType {
    case 判断题
    case 单选题
    case 多选题
}

class QuestionTitleLabel: UILabel {

    var questionType: QuestionType
    
    override init(frame: CGRect) {
        self.questionType = .判断题
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.questionType = .判断题
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
