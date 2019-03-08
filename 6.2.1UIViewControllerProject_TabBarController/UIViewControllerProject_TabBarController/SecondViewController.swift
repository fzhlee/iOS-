//
//  SecondViewController.swift
//  UIViewOntrollerProject_ScrollView
//
//  Created by Jerry on 16/5/30.
//  Copyright © 2016年 www.coolketang.com. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.purple
        self.title = "Item #2"
        self.tabBarItem.image = UIImage(named: "Tab2")
        
        let label = UILabel(frame: CGRect(x: 40, y: 150, width: 240, height: 44))
        label.text = "第二页"
        label.textAlignment = NSTextAlignment.center
        label.font = UIFont(name: "Arial", size: 36)
        self.view.addSubview(label)
        
        self.tabBarItem.badgeValue = "8"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
