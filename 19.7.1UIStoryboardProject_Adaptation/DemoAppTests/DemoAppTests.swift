//
//  DemoAppTests.swift
//  DemoAppTests
//
//  Created by Jerry on 16/5/19.
//  Copyright © 2016年 www.coolketang.com. All rights reserved.
//

import XCTest

class DemoAppTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        print("正在调用setUp方法。")
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        print("正在调用tearDown方法。")
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        

    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
