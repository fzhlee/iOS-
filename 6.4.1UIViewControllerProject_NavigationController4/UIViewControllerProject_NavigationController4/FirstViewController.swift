//
//  FirstViewController.swift
//  UIViewControllerProject_NavigationController4
//
//  Created by Jerry on 16/8/10.
//  Copyright © 2016年 www.coolketang.com. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "第一页"
        self.tabBarItem.image = UIImage(named: "Tab1")
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
    override func prepare(for segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
