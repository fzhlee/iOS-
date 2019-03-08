//
//  ProgressCircleView.swift
//  DemoApp
//
//  Created by Jerry on 2018/1/30.
//  Copyright © 2018年 www.coolketang.com. All rights reserved.
//

import UIKit
import UICircularProgressRing

enum Greeting {
    case 完美
    case 很棒
    case 及格
    case 加油
}

class ProgressCircleView: UICircularProgressRingView {
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        
        self.fontColor = .white
        let greetingLabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height))
        greetingLabel.text = "\(Greeting.完美)"
        greetingLabel.font = UIFont.boldSystemFont(ofSize: CIRCLEFONTSIZEBIG)
        greetingLabel.textAlignment = .center
        greetingLabel.tag = 1
        greetingLabel.textColor = UIColor(red: 93/255, green: 75/255, blue: 153/255, alpha: 1.0)
        self.addSubview(greetingLabel)
        
        let rateLabel = UILabel(frame: CGRect(x: 0, y: self.frame.height/2, width: self.frame.width, height: self.frame.height*0.8/2))
        rateLabel.text = "100%"
        rateLabel.font = UIFont.boldSystemFont(ofSize: CIRCLEFONTSIZESMALL)
        rateLabel.textAlignment = .center
        rateLabel.tag = 2
        rateLabel.textColor = UIColor(red: 93/255, green: 75/255, blue: 153/255, alpha: 1.0)
        self.addSubview(rateLabel)
        
    }
    
    func updateSubView()
    {
        let greetingLabel = self.viewWithTag(1) as! UILabel
        greetingLabel.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
        
        let rateLabel = self.viewWithTag(2) as! UILabel
        rateLabel.frame = CGRect(x: 0, y: self.frame.height/2, width: self.frame.width, height: self.frame.height*0.8/2)
    }
    
    func setScore(score:Int)
    {
        let greetingLabel = self.viewWithTag(1) as! UILabel
        switch score
        {
            case 0...59:
                greetingLabel.text = "\(Greeting.加油)"
            case 60...69:
                greetingLabel.text = "\(Greeting.及格)"
            case 70...89:
                greetingLabel.text = "\(Greeting.很棒)"
            case 90...100:
                greetingLabel.text = "\(Greeting.完美)"
            default:
                break
        }
        
        let rateLabel = self.viewWithTag(2) as! UILabel
        rateLabel.text = "\(score)%"
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
