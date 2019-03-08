//
//  ViewController.swift
//  InstrumentsProject_Demo
//
//  Created by Jerry on 16/6/26.
//  Copyright © 2016年 www.coolketang.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let button = UIButton(frame: CGRect(x: 20, y: 40, width: 280, height: 44))
        button.setTitle("PeopleAndPet", for: .normal)
        button.backgroundColor = UIColor.black
        button.addTarget(self, action: #selector(ViewController.peopleAndPet), for: UIControlEvents.touchUpInside)
        self.view.addSubview(button)
    }
    
    func peopleAndPet()
    {
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

