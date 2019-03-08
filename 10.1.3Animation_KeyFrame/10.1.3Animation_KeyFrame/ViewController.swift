//
//  ViewController.swift
//  10.1.3Animation_KeyFrame
//
//  Created by Jerry on 16/7/15.
//  Copyright © 2016年 www.coolketang.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController,CAAnimationDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let imageView = UIImageView(frame: CGRect(x: 40, y: 80, width: 64, height: 64))
        imageView.image = UIImage(named: "star")
        self.view.addSubview(imageView)
        
        let animation = CAKeyframeAnimation(keyPath: "position")
        
        let point1 = CGPoint(x: 40, y: 80)
        let point2 = CGPoint(x: 280, y: 80)
        let point3 = CGPoint(x: 60, y: 300)
        let point4 = CGPoint(x: 280, y: 300)
        
        animation.values = [NSValue(cgPoint: point1), NSValue(cgPoint: point2),
                            NSValue(cgPoint: point3), NSValue(cgPoint: point4)]
        animation.keyTimes = [NSNumber(value: 0.0), NSNumber(value: 0.4),
                              NSNumber(value: 0.6), NSNumber(value: 1.0)]
        
        animation.delegate = self
        animation.duration = 5.0
        
        imageView.layer.add(animation, forKey: "Move")
    }
    
    func animationDidStart(_ anim: CAAnimation) {
        print("The animation starts")
    }
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        print("End of the animation")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

