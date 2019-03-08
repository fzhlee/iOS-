//
//  ViewController.swift
//  UIWebViewProject_LoadLocalPage
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
        
        let path = Bundle.main.path(forResource: "Register", ofType: "html")
        let url = URL(string: path!)
        webView.loadRequest(NSURLRequest(url: url!) as URLRequest)
        
        let getInfo = UIButton(frame: CGRect(x: 40, y: 400, width: 240, height: 44))
        getInfo.setTitle("获得页面信息", for: .normal)
        getInfo.backgroundColor = UIColor.brown
        getInfo.addTarget(self, action: #selector(ViewController.getInfo), for: .touchUpInside)
        
        let submitForm = UIButton(frame: CGRect(x: 40, y: 470, width: 240, height: 44))
        submitForm.setTitle("设置并提交表单", for: .normal)
        submitForm.backgroundColor = UIColor.brown
        submitForm.addTarget(self, action: #selector(ViewController.submitForm), for: .touchUpInside)
        
        self.view.addSubview(getInfo)
        self.view.addSubview(submitForm)
    }
    
    @objc func getInfo()
    {
        let url = webView.stringByEvaluatingJavaScript(from: "document.location.href")
        let title = webView.stringByEvaluatingJavaScript(from: "document.title")
        let info = url! + "\n" + title!
        print(info)
    }
    
    @objc func submitForm()
    {
        let firstJs = "document.getElementById('userName').value = 'Jerry'"
        let secondJs = "submitForm()"
        webView.stringByEvaluatingJavaScript(from: firstJs)
        webView.stringByEvaluatingJavaScript(from: secondJs)
    }
}

