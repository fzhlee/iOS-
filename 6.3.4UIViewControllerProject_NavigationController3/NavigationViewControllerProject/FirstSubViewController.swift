//
//  FirstSubViewController.swift
//  NavigationViewControllerProject
//
//  Created by Jerry on 16/5/19.
//  Copyright © 2016年 www.coolketang.com. All rights reserved.
//

import UIKit

class FirstSubViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "First Page"
        self.view.backgroundColor = UIColor.brown
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Next", style: UIBarButtonItemStyle.plain, target: self, action: #selector(FirstSubViewController.nextPage))
    }
    
    func nextPage()
    {
        let viewController = SecondSubViewController()
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.prompt = "正在载入..."
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(FirstSubViewController.refresh))
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.barStyle = UIBarStyle.black
        self.navigationController?.navigationBar.tintColor = UIColor.orange
    }
    
    @objc func refresh()
    {
        print("刷新数据。")
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
