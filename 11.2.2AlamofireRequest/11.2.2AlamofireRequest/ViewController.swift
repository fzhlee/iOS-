//
//  ViewController.swift
//  11.2.2AlamofireRequest
//
//  Created by Jerry on 2018/3/14.
//  Copyright © 2018年 www.coolketang.com. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        postHandler()
    }
    
    func responseJsonHandler()
    {
        Alamofire.request("https://httpbin.org/get").responseJSON
            { response in
                if let json = response.result.value
                {
                    print("JSON: \(json)")
                }
        }
    }
    
    func postHandler()
    {
        var parameters : Dictionary<String, String>
        parameters = ["email": "fzhlee@coolketang.com", "password": "123456"]
        
        let url = "https://httpbin.org/post"
        Alamofire.request(url, method: HTTPMethod.post, parameters: parameters).responseJSON
            { response in
                debugPrint("httpMethod:"+(response.request?.httpMethod)! )
                debugPrint("allHTTPHeaderFields:+",response.request?.allHTTPHeaderFields ?? "")
                
                if let json = response.result.value
                {
                    print("JSON: \(json)")
                }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

