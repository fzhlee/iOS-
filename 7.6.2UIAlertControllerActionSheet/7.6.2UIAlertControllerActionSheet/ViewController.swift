//
//  ViewController.swift
//  7.6.2UIAlertControllerActionSheet
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
        button.addTarget(self, action: #selector(showActionSheet), for: .touchUpInside)
        button.backgroundColor = UIColor.orange
        self.view.addSubview(button)
    }
    
    @objc func showActionSheet()
    {
        let actionSheet = UIAlertController(title: "Information", message: "What's your favorite?", preferredStyle: UIAlertControllerStyle.actionSheet)
        
        let fishing = UIAlertAction(title: "Fishing", style: UIAlertActionStyle.default, handler: {(alerts: UIAlertAction) -> Void in print("I like fishing")
        })
        
        let hunting = UIAlertAction(title: "Hunting", style: UIAlertActionStyle.destructive, handler: {(alerts: UIAlertAction) -> Void in print("I like hunting")
        })
        
        let nothing = UIAlertAction(title: "Nothing", style: UIAlertActionStyle.cancel, handler: {(alerts: UIAlertAction) -> Void in print("A Life of Nonsense.")
        })
        
        actionSheet.addAction(fishing)
        actionSheet.addAction(hunting)
        actionSheet.addAction(nothing)
        
        self.present(actionSheet, animated: true) {
            print("What's your favorite?")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

