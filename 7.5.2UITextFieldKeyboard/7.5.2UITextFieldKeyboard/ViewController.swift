//
//  ViewController.swift
//  7.5.2UITextFieldKeyboard
//
//  Created by Jerry on 2018/3/13.
//  Copyright © 2018年 www.coolketang.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    var textField : UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let rect = CGRect(x: 30, y: 480, width: 260, height: 30)
        textField = UITextField(frame: rect)
        textField.borderStyle = UITextBorderStyle.roundedRect
        textField.delegate = self
        
        self.view.addSubview(textField)
        
        NotificationCenter.default.addObserver(self,
                            selector: #selector(keyboardWillShow(_:)),
                            name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        
        NotificationCenter.default.addObserver(self,
                            selector: #selector(keyboardWillHide(_:)),
                            name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }

    // MARK:
    // MARK:键盘事件
    @objc func keyboardWillShow(_ notification: Notification?)
    {
        textField.frame = CGRect(x: 30, y: 280, width: 260, height: 30)
    }
    
    @objc func keyboardWillHide(_ notification: Notification?)
    {
        textField.frame = CGRect(x: 30, y: 480, width: 260, height: 30)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

