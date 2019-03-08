//
//  ViewController.swift
//  9.2.1UIGestureRecognizer_Tap
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
        
        let guesture = UITapGestureRecognizer(target: self, action: #selector(ViewController.singleTap))
        imageView.addGestureRecognizer(guesture)
    }
    
    @objc func singleTap()
    {
        let image = UIImage(named: "unlock")
        imageView.image = image
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
