//
//  Pet.swift
//  InstrumentsProject_Demo
//
//  Created by Jerry on 18/6/26.
//  Copyright © 2018年 www.coolketang.com. All rights reserved.
//

class Pet {
    var name : String
    var master : People?
    
    init(name:String){
        self.name = name
        print("Pet被初始化")
    }
    
    deinit{
        
        print("Pet被销毁")
    }
}
