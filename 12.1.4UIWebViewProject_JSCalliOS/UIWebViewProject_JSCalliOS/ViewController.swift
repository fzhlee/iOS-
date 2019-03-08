//
//  ViewController.swift
//  UIWebViewProject_JSCalliOS
//
//  Created by Jerry on 16/6/17.
//  Copyright © 2016年 www.coolketang.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIWebViewDelegate {
    
    var webView:UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let bounds = UIScreen.main.bounds
        let frame = CGRect(x: 0, y: 40, width: bounds.width, height: bounds.height)
        webView = UIWebView(frame: frame)
        webView.delegate = self
        webView.backgroundColor = UIColor.clear
        self.view.addSubview(webView)
        
        let path = Bundle.main.path(forResource: "GetDeviceInfo", ofType: "html")
        let url = URL(string: path!)
        webView.loadRequest(NSURLRequest(url: url!) as URLRequest)
    }
    
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        let url = request.url?.absoluteString
        let components = url?.components(separatedBy: ":")
        let firstElement = components?[0]
        if (components?.count)! > 1 && firstElement! == "callios"
        {
            let model = UIDevice.current.model
            let systemName = UIDevice.current.systemName
            let systemVersion = UIDevice.current.systemVersion
            
            let message = "设备类型:"+model+"\\n系统类型:"+systemName+"\\n系统版本:"+systemVersion
            webView.stringByEvaluatingJavaScript(from: "alert('" + message + "')")
            return false
        }
        return true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

