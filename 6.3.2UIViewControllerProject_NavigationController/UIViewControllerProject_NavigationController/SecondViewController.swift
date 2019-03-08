//
//  SecondViewController.swift
//  UIViewControllerProject_NavigationController
//
//  Created by Jerry on 16/5/31.
//  Copyright © 2016年 www.coolketang.com. All rights reserved.
//

import UIKit

var pageNum = 0
class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        pageNum = pageNum + 1
        
        self.title = "第\(pageNum)页"
        self.view.backgroundColor = UIColor.purple
        
        let push = UIButton(frame: CGRect(x: 40, y: 120, width: 240, height: 40))
        push.setTitle("Push Page", for: UIControlState())
        push.backgroundColor = UIColor.orange
        push.addTarget(self, action: #selector(SecondViewController.pushPage), for: UIControlEvents.touchUpInside)
        self.view.addSubview(push)
        
        let pop = UIButton(frame: CGRect(x: 40, y: 180, width: 240, height: 40))
        pop.setTitle("Pop Page", for: UIControlState())
        pop.backgroundColor = UIColor.orange
        pop.addTarget(self, action: #selector(SecondViewController.popPage), for: UIControlEvents.touchUpInside)
        self.view.addSubview(pop)
        
        let index = UIButton(frame: CGRect(x: 40, y: 280, width: 240, height: 40))
        index.setTitle("Goto Index Page", for: UIControlState())
        index.backgroundColor = UIColor.orange
        index.addTarget(self, action: #selector(SecondViewController.gotoIndexPage), for: UIControlEvents.touchUpInside)
        self.view.addSubview(index)
        
        let root = UIButton(frame: CGRect(x: 40, y: 340, width: 240, height: 40))
        root.setTitle("Goto Root Page", for: UIControlState())
        root.backgroundColor = UIColor.orange
        root.addTarget(self, action: #selector(SecondViewController.gotoRootPage), for: UIControlEvents.touchUpInside)
        self.view.addSubview(root)
    }
    
    @objc func pushPage()
    {
        let viewController = SecondViewController()
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    @objc func popPage()
    {
        self.navigationController?.popViewController(animated: true)
    }
    @objc func gotoIndexPage()
    {
        let viewController = self.navigationController?.viewControllers[2]
        self.navigationController?.popToViewController(viewController!, animated: true)
    }
    @objc func gotoRootPage()
    {
        self.navigationController?.popToRootViewController(animated: true)
    }
}
