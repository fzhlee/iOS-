//
//  ViewController.swift
//  7.5.1UITextField
//
//  Created by Jerry on 2018/3/13.
//  Copyright © 2018年 www.coolketang.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let textField = UITextField(frame: CGRect(x: 30, y: 80, width: 260, height: 40))
        
        textField.borderStyle = UITextBorderStyle.roundedRect
        textField.placeholder = "Your Password"
        textField.autocorrectionType = UITextAutocorrectionType.no
        textField.returnKeyType = UIReturnKeyType.done
        textField.clearButtonMode = UITextFieldViewMode.whileEditing
        textField.keyboardType = UIKeyboardType.default
        textField.keyboardAppearance = UIKeyboardAppearance.dark
        textField.isSecureTextEntry = true
        
        let lock = UIImage(named: "lock")
        let lockView = UIImageView(image: lock)
        lockView.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        textField.leftView = lockView
        textField.leftViewMode = .always
        
        textField.delegate = self
        self.view.addSubview(textField)
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

