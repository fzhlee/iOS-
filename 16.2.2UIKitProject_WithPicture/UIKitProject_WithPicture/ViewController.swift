//
//  ViewController.swift
//  UIKitProject_WithPicture
//
//  Created by Jerry on 16/6/23.
//  Copyright © 2016年 www.coolketang.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor.brown
        let textView = UITextView(frame: CGRect(x: 20, y: 40, width: 280, height: 500))
        textView.backgroundColor = UIColor.brown
        textView.font = UIFont.systemFont(ofSize: 22)
        self.view.addSubview(textView)
        
        let textStorage = textView.textStorage
        let path = Bundle.main.url(forResource: "word", withExtension: "txt")
        do {
            let string = try String(contentsOf: path!)
            textStorage.replaceCharacters(in: NSRange(location: 0,length: 0), with: string)
        }
        catch{
            print("读取文件错误！")
        }
        
        let image = UIImage(named: "Tea")
        let imageView = UIImageView(image: image)
        let rect = CGRect(x: 80, y: 80, width: 150, height: 150)
        imageView.frame = rect
        
        imageView.layer.cornerRadius = 75
        imageView.layer.masksToBounds = true
        imageView.layer.borderWidth = 10
        self.view.addSubview(imageView)
        
        var frame = textView.convert(imageView.bounds, from: imageView)
        frame.origin.x -= textView.textContainerInset.left;
        frame.origin.y -= textView.textContainerInset.top;
        
        let path2 = UIBezierPath(ovalIn: frame)
        textView.textContainer.exclusionPaths = [path2]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

