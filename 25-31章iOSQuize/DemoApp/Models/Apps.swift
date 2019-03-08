//
//  Interview.swift
//  DemoApp
//
//  Created by Jerry on 2018/1/31.
//  Copyright © 2018年 www.coolketang.com. All rights reserved.
//

import ObjectMapper

class Apps : Mappable {
    var icons: String?
    var titles: String?
    var subTitles: String?
    var links: String?
    
    required init?(map: Map){}
    
    func mapping(map: Map)
    {
        icons <- map["icons"]
        titles <- map["titles"]
        subTitles <- map["subTitles"]
        links <- map["links"]
    }
}
