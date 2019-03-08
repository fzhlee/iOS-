//
//  SecondViewController.swift
//  UIViewControllerProject_NavigationController4
//
//  Created by Jerry on 16/8/10.
//  Copyright © 2016年 www.coolketang.com. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "第二页"
        self.tabBarItem.image = UIImage(named: "Tab2")
        self.view.backgroundColor = UIColor.purple

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
