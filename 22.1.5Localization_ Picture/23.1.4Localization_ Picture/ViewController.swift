//
//  ViewController.swift
//  23.1.4Localization_ Picture
//
//  Created by Jerry on 16/7/23.
//  Copyright © 2016年 www.coolketang.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let localizedImage = UIImage(named: "contentMarketing")
        let imageView = UIImageView(image: localizedImage)
        imageView.frame = CGRect(x: 0, y: 40, width: 320, height: 380)
        imageView.image = localizedImage
        
        self.view.backgroundColor = UIColor(red: 0, green: 154.0/255.0, blue: 154.0/255.0, alpha: 1.0)
        self.view.addSubview(imageView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

