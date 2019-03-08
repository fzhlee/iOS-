//
//  SecondSubViewController.swift
//  NavigationViewControllerProject
//
//  Created by Jerry on 16/5/19.
//  Copyright © 2016年 www.coolketang.com. All rights reserved.
//

import UIKit

class SecondSubViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "Second Page"
        self.view.backgroundColor = UIColor.purple
        
        let btHideNavBar = UIButton(frame: CGRect(x: 40, y: 200, width: 240, height: 30))
        btHideNavBar.setTitle("Hide navigation bar", for: UIControlState())
        btHideNavBar.backgroundColor = UIColor.orange
        btHideNavBar.addTarget(self, action: #selector(SecondSubViewController.hideNavigatonBar), for: UIControlEvents.touchUpInside)
        self.view.addSubview(btHideNavBar)
        
        let btHideToolBar = UIButton(frame: CGRect(x: 40, y: 260, width: 240, height: 30))
        btHideToolBar.setTitle("Hide tool bar", for: UIControlState())
        btHideToolBar.backgroundColor = UIColor.orange
        btHideToolBar.addTarget(self, action: #selector(SecondSubViewController.hideToolBar), for: UIControlEvents.touchUpInside)
        self.view.addSubview(btHideToolBar)
    }
    
    @objc func hideNavigatonBar()
    {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }

    @objc func hideToolBar()
    {
        self.navigationController?.setToolbarHidden(true, animated: true)
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
