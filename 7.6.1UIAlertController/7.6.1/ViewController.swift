//
//  ViewController.swift
//  7.6.1
//
//  Created by Jerry on 2018/3/13.
//  Copyright © 2018年 www.coolketang.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let button = UIButton(type: UIButtonType.system)
        button.frame = CGRect(x: 20, y: 120, width: 280, height: 44)
        button.setTitle("Question", for: .normal)
        button.addTarget(self, action: #selector(ViewController.showAlert), for: .touchUpInside)
        button.backgroundColor = UIColor.orange
        self.view.addSubview(button)
    }
    
    @objc func showAlert()
    {
        let alert = UIAlertController(title: "Information", message: "Are you a student?", preferredStyle: UIAlertControllerStyle.alert)
        
        let yes = UIAlertAction(title: "Yes", style: UIAlertActionStyle.default, handler: {(alerts: UIAlertAction) -> Void in print("Yes, I'm a student.")})
        
        let no = UIAlertAction(title: "No", style: UIAlertActionStyle.destructive, handler: {(alerts: UIAlertAction) -> Void in print("No, I'm not a student.")})
        
        let cancel = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: nil)

        alert.addAction(yes)
        alert.addAction(no)
        alert.addAction(cancel)
        
        self.present(alert, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

