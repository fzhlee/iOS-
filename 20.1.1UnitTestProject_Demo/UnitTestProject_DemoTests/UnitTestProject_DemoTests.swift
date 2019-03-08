//
//  UnitTestProject_DemoTests.swift
//  UnitTestProject_DemoTests
//
//  Created by Jerry on 16/6/24.
//  Copyright © 2016年 www.coolketang.com. All rights reserved.
//

import XCTest
@testable import UnitTestProject_Demo

class UnitTestProject_DemoTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        print("正在调用setUp方法。")
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        print("正在调用tearDown方法。")
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let peopleID = "350211198203150012"
        let count = peopleID.characters.count
        XCTAssert(count == 15 || count == 18, "错误的身份证号码");
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
            
        }
    }
    
}
