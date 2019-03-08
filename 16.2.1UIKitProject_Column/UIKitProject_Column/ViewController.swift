//
//  ViewController.swift
//  UIKitProject_Column
//
//  Created by Jerry on 16/6/23.
//  Copyright © 2016年 www.coolketang.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let firstTextView = UITextView(frame: CGRect(x: 20, y: 40, width: 135, height: 200))
        firstTextView.backgroundColor = UIColor.brown
        firstTextView.isScrollEnabled = false;
        self.view.addSubview(firstTextView)
        
        let textStorage = firstTextView.textStorage
        let path = Bundle.main.url(forResource: "word", withExtension: "txt")
        do {
            let string = try String(contentsOf: path!)
            textStorage.replaceCharacters(in: NSRange(location: 0,length: 0), with: string)
        }
        catch{
            print("读取文件错误！")
        }
        
        let secondRect = CGRect(x: 165, y: 40, width: 135, height: 200)
        let secondTextContainer = NSTextContainer()
        let secondTextView = UITextView(frame: secondRect, textContainer: secondTextContainer)
        secondTextView.backgroundColor = UIColor.brown
        secondTextView.isScrollEnabled = false;
        self.view.addSubview(secondTextView)
        
        let thirdRect = CGRect(x: 20, y: 250, width: 280, height: 300)
        let thirdTextContainer = NSTextContainer()
        let thirdTextView = UITextView(frame: thirdRect, textContainer: thirdTextContainer)
        thirdTextView.backgroundColor = UIColor.purple
        thirdTextView.isScrollEnabled = false;
        self.view.addSubview(thirdTextView)
        
        let layoutManager = NSLayoutManager()
        layoutManager.addTextContainer(firstTextView.textContainer)
        layoutManager.addTextContainer(secondTextContainer)
        layoutManager.addTextContainer(thirdTextContainer)
        textStorage.addLayoutManager(layoutManager)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

