//
//  ViewController.swift
//  11.2.4AlamofireUpload
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
        let fileURL = Bundle.main.url(forResource: "iphone_large_2x", withExtension: "jpg")
        Alamofire.upload(fileURL!,to:"https://httpbin.org/post")
            .uploadProgress { progress in
                print("---fractionCompleted:\(progress.fractionCompleted)")
                print("---completedUnitCount:\(progress.completedUnitCount)")
                print("---totalUnitCount:\(progress.totalUnitCount)")
            }
            .responseJSON { response in
                let message = "Result:\(response.result)"
                print(message)
                print(response.timeline)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

