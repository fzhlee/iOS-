//
//  ViewController.swift
//  9.2.2UIGestureRecognizer_Pinch
//
//  Created by Jerry on 16/7/14.
//  Copyright © 2016年 www.coolketang.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let rect = CGRect(x: 0, y: 80, width: 320, height: 320)
        let imageView = UIImageView(frame: rect)
        
        let image = UIImage(named: "Hand")
        imageView.image = image
        
        imageView.isUserInteractionEnabled = true
        self.view.addSubview(imageView)
        
        let guesture = UIPinchGestureRecognizer(target: self, action:#selector(ViewController.pinchImage(_:)))
        imageView.addGestureRecognizer(guesture)
    }
    
    @objc func pinchImage(_ recognizer:UIPinchGestureRecognizer)
    {
        recognizer.view?.transform = (recognizer.view?.transform.scaledBy(x: recognizer.scale, y: recognizer.scale))!
        //recognizer.view?.transform = transform!
        recognizer.scale = 1;
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
