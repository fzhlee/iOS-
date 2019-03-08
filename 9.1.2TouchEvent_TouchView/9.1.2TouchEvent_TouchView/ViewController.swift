//
//  ViewController.swift
//  9.1.2TouchEvent_TouchView
//
//  Created by Jerry on 16/7/13.
//  Copyright © 2016年 www.coolketang.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var imageView : UIImageView!
    var isTouchInImageView : Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let image = UIImage(named: "Star")
        self.imageView = UIImageView(image: image)
        self.view.addSubview(self.imageView)
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        let touchPoint = touch?.location(in: self.view)
        
        let imageViewFrame = self.imageView.frame
        let minX = imageViewFrame.origin.x
        let minY = imageViewFrame.origin.y
        let maxX = minX + imageViewFrame.size.width
        let maxY = minY + imageViewFrame.size.height
        if (touchPoint?.x)! >= minX && (touchPoint?.x)! <= maxX && (touchPoint?.y)! >= minY && (touchPoint?.y)! <= maxY
        {
            isTouchInImageView = true;
            print("您获得一枚星星");
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if !isTouchInImageView{
            return;
        }
        let touch = touches.first
        let touchPoint = touch?.location(in: self.view)
        let touchPrePoint = touch?.previousLocation(in: self.view)
        let disX = (touchPoint?.x)! - (touchPrePoint?.x)!
        let disY = (touchPoint?.y)! - (touchPrePoint?.y)!
        
        var centerPoint = self.imageView.center
        centerPoint.x += disX
        centerPoint.y += disY
        self.imageView.center = centerPoint
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        isTouchInImageView = false;
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

