//
//  Forecast.swift
//  DemoApp
//
//  Created by LiFazhan on 2017/1/10.
//  Copyright © 2017 www.coolketang.com. All rights reserved.
//

import ObjectMapper

class Forecast: Mappable
{
    var day: String?
    var temperature: Int?
    var conditions: String?
    
    required init?(map: Map)
    {
        
    }
    
    func mapping(map: Map)
    {
        day <- map["day"]
        temperature <- map["temperature"]
        conditions <- map["conditions"]
    }
}
