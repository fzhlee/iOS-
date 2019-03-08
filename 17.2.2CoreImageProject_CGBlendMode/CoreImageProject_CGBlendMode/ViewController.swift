//
//  ViewController.swift
//  CoreImageProject_CGBlendMode
//
//  Created by Jerry on 16/6/21.
//  Copyright © 2016年 www.coolketang.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let originalImage = UIImageView(frame: CGRect(x: 128, y: 80, width: 64, height: 64))
        originalImage.image = UIImage(named: "star")
        self.view.addSubview(originalImage)
        
        let brownOne = UIImageView(frame: CGRect(x: 128, y: 180, width: 64, height: 64))
        brownOne.image = UIImage(named: "star")?.blendColor(UIColor.blue)
        self.view.addSubview(brownOne)
        
        let redOne = UIImageView(frame: CGRect(x: 128, y: 280, width: 64, height: 64))
        redOne.image = UIImage(named: "star")?.blendColor(UIColor.red)
        self.view.addSubview(redOne)
        
        let greenOne = UIImageView(frame: CGRect(x: 128, y: 380, width: 64, height: 64))
        greenOne.image = UIImage(named: "star")?.blendColor(UIColor.green)
        self.view.addSubview(greenOne)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

