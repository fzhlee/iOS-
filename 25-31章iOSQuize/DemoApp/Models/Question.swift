//
//  Question.swift
//  DemoApp
//
//  Created by Jerry on 2018/1/31.
//  Copyright © 2018年 www.coolketang.com. All rights reserved.
//

import Foundation
struct Question : Codable {
    let sequence: Int
    let question: String
    let answers: Array<String>
    let right: String
    let tags: Array<String>
}
