//
//  ViewController.swift
//  UIStoryboardProject_UIControl
//
//  Created by Jerry on 16/6/1.
//  Copyright © 2016年 www.coolketang.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentImageNum = 1
    @IBOutlet var picName: UILabel!
    @IBOutlet var imageView: UIImageView!
    @IBAction func nextPicture(_ sender: AnyObject) {
        currentImageNum += 1
        let pciture = "Pic\(currentImageNum)"
        imageView.image = UIImage(named: pciture)
        picName.text = pciture
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

