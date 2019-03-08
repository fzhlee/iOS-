//
//  ViewController.swift
//  9.2.1UIGestureRecognizer_LongPress
//
//  Created by Jerry on 16/7/13.
//  Copyright © 2016年 www.coolketang.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var imageView : UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let rect = CGRect(x: 0, y: 80, width: 320, height: 320)
        self.imageView = UIImageView(frame: rect)
        
        let image = UIImage(named: "lock")
        imageView.image = image
        
        imageView.isUserInteractionEnabled = true
        self.view.addSubview(self.imageView)
        
        let guesture = UILongPressGestureRecognizer(target: self, action:#selector(ViewController.longPress(_:)))
        guesture.minimumPressDuration = 1.0
        guesture.allowableMovement = 20.0
        imageView.addGestureRecognizer(guesture)
    }
    
    @objc func longPress(_ gusture:UILongPressGestureRecognizer)
    {
        if(gusture.state == UIGestureRecognizerState.began)
        {
            let image = UIImage(named: "unlock")
            imageView.image = image
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
