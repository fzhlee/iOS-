//
//  ViewController.swift
//  InstrumentsProject_Leaks
//
//  Created by Jerry on 16/6/28.
//  Copyright © 2016年 www.coolketang.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var master:People?
        var dog:Pet?
        
        master = People(name: "Jerry")
        dog = Pet(name: "Dog")
        
        master!.pet = dog
        dog!.master = master
        
        master = nil
        dog = nil
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

