//
//  People.swift
//  InstrumentsProject_Demo
//
//  Created by Jerry on 16/6/26.
//  Copyright © 2016年 www.coolketang.com. All rights reserved.
//

class People {
    var name : String
    var pet : Pet?
    
    init(name:String){
        self.name = name
        print("People被初始化")
    }
    
    deinit{
        print("People被销毁")
    }
}
