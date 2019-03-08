//
//  ViewController.swift
//  11.1.3NSURLConnectionGet
//
//  Created by Jerry on 2018/3/15.
//  Copyright © 2018年 www.coolketang.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var label : UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        label = UILabel(frame: CGRect(x: 0, y: 0, width: 320, height: 568))
        label.text = "Loading..."
        label.font = UIFont(name: "Arial", size: 14)
        label.backgroundColor = UIColor.orange
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        self.view.addSubview(label)
        
        let urlString:String = "https://www.coolketang.com"
        let url:URL! = URL(string:urlString)
        
        let request:URLRequest = URLRequest(url: url)
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: request, completionHandler: {(data, response, error) -> Void in
            if let error = error
            {
                print(error.localizedDescription)
            }
            else
            {
                DispatchQueue.main.async {
                    let str = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
                    self.label.text = str as String?
                }
            }
        })
        
        dataTask.resume()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

