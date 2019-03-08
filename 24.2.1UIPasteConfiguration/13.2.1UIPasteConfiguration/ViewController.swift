//
//  ViewController.swift
//  13.2.1UIPasteConfiguration
//
//  Created by Jerry on 2018/3/16.
//  Copyright © 2018年 www.coolketang.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIDragInteractionDelegate {

    var label : UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        label = UILabel(frame: CGRect(x: 20, y: 40, width: 280, height: 50))
        label.text = "coolketang.com"
        label.isUserInteractionEnabled = true
        label.backgroundColor = .orange
        label.addInteraction(UIDragInteraction.init(delegate: self))
        self.view.addSubview(label)
        
        let textField = UITextField.init(frame: CGRect.init(x: 420, y: 40, width: 280, height: 50))
        textField.placeholder = "Put label here"
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .yellow
        textField.pasteConfiguration = UIPasteConfiguration(forAccepting: NSString.self)
        view.addSubview(textField)
        
    }
    func dragInteraction(_ interaction: UIDragInteraction, itemsForBeginning session: UIDragSession) -> [UIDragItem] {
        if interaction.view == label
        {
            let dragText = label.text
            let itemProvider = NSItemProvider.init(object: dragText! as NSString)
            return [UIDragItem.init(itemProvider: itemProvider)]
        }
        return []
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

