//
//  Util.swift
//  UnitTestProject_Demo
//
//  Created by Jerry on 16/6/24.
//  Copyright © 2016年 www.coolketang.com. All rights reserved.
//

import UIKit

struct RegexHelper {
    let regex: NSRegularExpression?
    
    init(_ pattern: String){
        do{
            regex = try NSRegularExpression(pattern: pattern, options: NSRegularExpression.Options.caseInsensitive)
        }
        catch{
            regex = nil
        }
    }
    
    func match(_ input: String) -> Bool
    {
        if let matches = regex?.matches(in: input,
                                        options: .reportProgress,
                                        range: NSMakeRange(0, input.lengthOfBytes(using: String.Encoding.utf8))){
            return matches.count > 0
        }else{
            return false
        }
    }
}

class EmailUtil{
    func validateEmail(email:String) -> Bool{
        let pattern = "^([a-z0-9_\\.-]+)@([\\da-z\\.-]+)\\.([a-z\\.]{2,6})$"
        let matcher = RegexHelper(pattern)
        
        if matcher.match(email){
            return true
        }
        return false
    }
}
