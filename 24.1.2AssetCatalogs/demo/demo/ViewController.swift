//
//  ViewController.swift
//  demo
//
//  Created by Jerry on 2018/3/17.
//  Copyright © 2018年 www.coolketang.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let normalOne  = UIImageView(image: UIImage(named: "star"))
        view.addSubview(normalOne)
        
        let biggerOne  = UIImageView(image: UIImage(named: "star"))
        biggerOne.frame = CGRect(x: 0, y: 200, width: normalOne.bounds.size.width * 6, height: normalOne.bounds.size.height * 6)
        biggerOne.center = self.view.center
        view.addSubview(biggerOne)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

