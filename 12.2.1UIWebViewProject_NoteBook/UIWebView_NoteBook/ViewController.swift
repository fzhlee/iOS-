//
//  ViewController.swift
//  UIWebView_NoteBook
//
//  Created by Jerry on 16/6/18.
//  Copyright © 2016年 www.coolketang.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var webView:UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let bounds = UIScreen.main.bounds
        let frame = CGRect(x: 0, y: 60, width: bounds.width, height: bounds.height-60)
        webView = UIWebView(frame: frame)
        webView.scrollView.showsVerticalScrollIndicator = true
        self.view.addSubview(webView)
        
        let path = Bundle.main.path(forResource: "NoteBook", ofType: "html")
        let url = URL(string: path!)
        webView.loadRequest(NSURLRequest(url: url!) as URLRequest)
        
        let inserImage = UIButton(frame: CGRect(x: 0, y: 20, width: 160, height: 40))
        inserImage.setTitle("插入图片", for: UIControlState.init(rawValue: 0))
        inserImage.backgroundColor = UIColor.purple
        inserImage.addTarget(self, action: #selector(ViewController.inserImage), for: .touchUpInside)
        self.view.addSubview(inserImage)
        
        let saveNote = UIButton(frame: CGRect(x: 160, y: 20, width: 160, height: 40))
        saveNote.setTitle("保存笔记", for: UIControlState.init(rawValue: 0))
        saveNote.backgroundColor = UIColor.brown
        saveNote.addTarget(self, action: #selector(ViewController.saveNote), for: .touchUpInside)
        self.view.addSubview(saveNote)
    }
    
    @objc func inserImage()
    {
        webView.stringByEvaluatingJavaScript(from: "insertImage('Coffee.png')")
    }
    
    @objc func saveNote()
    {
        let note = webView.stringByEvaluatingJavaScript(from: "getNote()")
        print(note ?? "")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

