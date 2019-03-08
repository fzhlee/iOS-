//
//  ViewController.swift
//  11.2.3AlamofireDownload
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
        complexDownload()
    }
    
    func simpleDownload()
    {
        let destination = DownloadRequest.suggestedDownloadDestination(
            for: .documentDirectory,
            in: .userDomainMask
        )
        print(NSHomeDirectory()+"/Documents")
        
        let result = Alamofire.download("https://httpbin.org/stream/1", to: destination)
        print(result)
    }
    
    func complexDownload()
    {
        let destination = DownloadRequest.suggestedDownloadDestination(
            for: .documentDirectory,
            in: .userDomainMask
        )
        
        let parameters: Parameters = ["foo": "bar"]
        
        Alamofire.download("http://images.apple.com/v/home/cx/images/gallery/iphone_large_2x.jpg", method: .get, parameters: parameters, encoding: JSONEncoding.default, to: destination)
            .downloadProgress(queue: DispatchQueue.global())
            { progress in
                print("Progress1: \(progress.fractionCompleted)")
                print("Progress2: \(progress.completedUnitCount)")
                print("Progress3: \(progress.totalUnitCount)")
            }
            .validate { request, response, temporaryURL, destinationURL in
                return .success
            }
            .responseJSON { response in
                debugPrint("response:\(response)")
                print("response.temporaryURL:\(String(describing: response.temporaryURL))")
                print("response.destinationURL:\(String(describing: response.destinationURL))")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

