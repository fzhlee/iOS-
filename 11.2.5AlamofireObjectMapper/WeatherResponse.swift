//
//  WeatherResponse.swift
//  DemoApp
//
//  Created by LiFazhan on 2017/1/10.
//  Copyright © 2017 www.coolketang.com. All rights reserved.
//

import ObjectMapper

class WeatherResponse: Mappable
{
    var location: String?
    var threeDayForecast: [Forecast]?
    
    required init?(map: Map)
    {
        
    }
    
    func mapping(map: Map)
    {
        location <- map["location"]
        threeDayForecast <- map["three_day_forecast"]
    }
}
