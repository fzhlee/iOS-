//
//  Util.swift
//  DemoApp
//
//  Created by Jerry on 2018/1/31.
//  Copyright © 2018年 www.coolketang.com. All rights reserved.
//

import Foundation

class Util
{
    class func getRandomInList(start: Int, end: Int) -> [Int]
    {
        let scope = end - start
        var startArr = Array(1...scope)
        var resultArr = Array(repeating: 0, count: scope)
        for i in 0..<startArr.count
        {
            let currentCount = UInt32(startArr.count - i)
            let index = Int(arc4random_uniform(currentCount))
            resultArr[i] = startArr[index]
            startArr[index] = startArr[Int(currentCount) - 1]
        }
        return resultArr.map { $0 + start }
    }
}
