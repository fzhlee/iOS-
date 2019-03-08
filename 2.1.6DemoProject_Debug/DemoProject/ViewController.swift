//
//  ViewController.swift
//  DemoProject
//
//  Created by Jerry on 16/6/15.
//  Copyright © 2016年 coolketang.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        appendThreeViews()
    }
    
    func appendThreeViews()
    {
        let firstView = UIView(frame: CGRect(x: 40, y: 80, width: 100, height: 100))
        firstView.backgroundColor = UIColor.green
        self.view.addSubview(firstView)
        
        let secondView = UIView(frame: CGRect(x: 40, y: 80, width: 120, height: 120))
        secondView.backgroundColor = UIColor.blue
        self.view.addSubview(secondView)
        
        let thirdView = UIView(frame: CGRect(x: 40, y: 80, width: 140, height: 140))
        thirdView.backgroundColor = UIColor.purple
        self.view.addSubview(thirdView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

