//
//  FirstViewController.swift
//  UIViewControllerProject_NavigationController
//
//  Created by Jerry on 16/5/31.
//  Copyright © 2016年 www.coolketang.com. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "第一页"
        self.view.backgroundColor = UIColor.brown
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "下一页", style: UIBarButtonItemStyle.plain, target: self, action: #selector(FirstViewController.nextPage))
    }
    
    @objc func nextPage()
    {
        let viewController = SecondViewController()
        self.navigationController?.pushViewController(viewController, animated: true)
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
