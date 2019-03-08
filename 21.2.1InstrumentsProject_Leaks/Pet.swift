//
//  Pet.swift
//  InstrumentsProject_Demo
//
//  Created by Jerry on 16/6/26.
//  Copyright © 2016年 www.coolketang.com. All rights reserved.
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
