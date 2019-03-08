//
//  ViewController.swift
//  UIWebViewProject_LoadHTMLGIF
//
//  Created by Jerry on 16/6/17.
//  Copyright © 2016年 www.coolketang.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var webView:UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let bounds = UIScreen.main.bounds
        let frame = CGRect(x: 0, y: 40, width: bounds.width, height: bounds.height)
        webView = UIWebView(frame: frame)
        webView.backgroundColor = UIColor.clear
        self.view.addSubview(webView)
        
        let loadHTML = UIButton(frame: CGRect(x: 40, y: 400, width: 240, height: 44))
        loadHTML.setTitle("加载HTML网页", for:.normal)
        loadHTML.backgroundColor = UIColor.brown
        loadHTML.addTarget(self, action: #selector(ViewController.loadHTML), for: .touchUpInside)
        
        let loadGIF = UIButton(frame: CGRect(x: 40, y: 470, width: 240, height: 44))
        loadGIF.setTitle("加载GIF动画", for: .normal)
        loadGIF.backgroundColor = UIColor.brown
        loadGIF.addTarget(self, action: #selector(ViewController.loadGIF), for: .touchUpInside)
        
        self.view.addSubview(loadHTML)
        self.view.addSubview(loadGIF)
    }
    
    @objc func loadHTML()
    {
        let team = "<div style='color:#ff0000;font-size:20px;'>团队名称：酷课堂</div>"
        let tel = "<div>电话：<span style='color:#ff0000'>15011122222</span></div>"
        let url = "<div><b>网址：http://www.coolketang.com</b></div>"
        let html = team + tel + url
        webView.dataDetectorTypes = [UIDataDetectorTypes.link, UIDataDetectorTypes.phoneNumber]
        webView.loadHTMLString(html, baseURL: nil)
    }
    
    @objc func loadGIF()
    {
        let resourceURL = Bundle.main.resourceURL
        webView.loadHTMLString("<img src='WildWorld.gif'>", baseURL: resourceURL)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

