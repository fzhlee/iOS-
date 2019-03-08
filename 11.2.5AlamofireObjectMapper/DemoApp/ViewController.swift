//
//  ViewController.swift
//  DemoApp
//
//  Created by LiFazhan on 2017/1/10.
//  Copyright © 2017 www.coolketang.com. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let URL = "https://raw.githubusercontent.com/tristanhimmelman/AlamofireObjectMapper/d8bb95982be8a11a2308e779bb9a9707ebe42ede/sample_json"
        
        Alamofire.request(URL).responseObject {
            (response: DataResponse<WeatherResponse>) in
            
            let weatherResponse = response.result.value
            print("Location: \(weatherResponse?.location ?? "")")
            
            if let threeDayForecast = weatherResponse?.threeDayForecast
            {
                for forecast in threeDayForecast
                {
                    print("forecast.day: \(forecast.day ?? "")")
                    print("forecast.temperature: \(forecast.temperature ?? 0)")
                }
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
