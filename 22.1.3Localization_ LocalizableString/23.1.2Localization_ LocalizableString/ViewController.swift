//
//  ViewController.swift
//  23.1.2Localization_ LocalizableString
//
//  Created by Jerry on 18/7/22.
//  Copyright © 2018年 www.coolketang.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let company = NSLocalizedString("Company", comment: "")
        let address = NSLocalizedString("Address", tableName: "UserService", bundle: Bundle.main, value: "", comment: "")
        
        let rectCompany = CGRect(x: 0, y: 0, width: 320, height: 284)
        let labelCompany = UILabel(frame: rectCompany)
        labelCompany.text = company
        labelCompany.font = UIFont.systemFont(ofSize: 42)
        labelCompany.backgroundColor = UIColor.orange
        self.view.addSubview(labelCompany)
        
        let rectAddress = CGRect(x: 0, y: 284, width: 320, height: 284)
        let labelAddress = UILabel(frame: rectAddress)
        labelAddress.text = address
        labelAddress.font = UIFont.systemFont(ofSize: 42)
        labelAddress.backgroundColor = UIColor.purple
        self.view.addSubview(labelAddress)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

