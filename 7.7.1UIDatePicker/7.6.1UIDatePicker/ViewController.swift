//
//  ViewController.swift
//  7.6.1UIDatePicker
//
//  Created by Jerry on 2018/3/13.
//  Copyright © 2018年 www.coolketang.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let datePicker = UIDatePicker()
        datePicker.center = CGPoint(x: 160, y: 200)
        datePicker.tag = 1
        datePicker.datePickerMode = UIDatePickerMode.dateAndTime
        datePicker.minimumDate = Date()
        datePicker.maximumDate = Date(timeInterval: 3*24*60*60, since: Date())
        self.view.addSubview(datePicker)
        
        let button = UIButton(type: UIButtonType.roundedRect)
        button.frame = CGRect(x: 20, y: 360, width: 280, height: 44)
        button.backgroundColor = UIColor.orange
        button.setTitle("Get date", for: .normal)
        button.addTarget(self, action: #selector(getDateTime(_:)), for: .touchUpInside)
        self.view.addSubview(button)
    }
    
    @objc func getDateTime(_ button:UIButton)
    {
        let datePicker = self.view.viewWithTag(1) as! UIDatePicker
        let date = datePicker.date
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "yyyy-MM-dd HH:mm"
        let dateAndTime = dateFormater.string(from: date)
        print(dateAndTime)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

