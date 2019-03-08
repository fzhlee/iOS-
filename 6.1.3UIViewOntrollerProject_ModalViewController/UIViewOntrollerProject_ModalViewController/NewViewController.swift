//
//  NewViewController.swift
//  UIViewOntrollerProject_ModalViewController
//
//  Created by Jerry on 16/5/30.
//  Copyright © 2016年 www.coolketang.com. All rights reserved.
//

import UIKit

class NewViewController: UIViewController {

    weak var viewController : ViewController?
    var labelTxt = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.purple
        let label =  UILabel(frame: CGRect(x: 40, y: 100, width: 240, height: 44))
        label.text = labelTxt
        self.view.addSubview(label)
        
        let button = UIButton(frame: CGRect(x: 40, y: 180, width: 240, height: 44))
        button.setTitle("关闭", for: .normal)
        button.backgroundColor = UIColor.black
        button.addTarget(self, action: #selector(NewViewController.dismissSelf), for: .touchUpInside)
        self.view.addSubview(button)
        // Do any additional setup after loading the view.
    }
    
    @objc func dismissSelf()
    {
        viewController?.label.text = "返回的参数。"
        self.dismiss(animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
