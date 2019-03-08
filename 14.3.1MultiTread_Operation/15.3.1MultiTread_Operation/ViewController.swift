//
//  ViewController.swift
//  15.3.1MultiTread_Operation
//
//  Created by Jerry on 16/7/26.
//  Copyright © 2016年 www.coolketang.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var topImageView = UIImageView()
    var footImageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        topImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 320, height: 280))
        self.view.addSubview(topImageView)
        
        footImageView = UIImageView(frame: CGRect(x: 0, y: 280, width: 320, height: 290))
        self.view.addSubview(footImageView)
        
        let downloadA = getOperation(name: "下载线程A", imageUrl: "http://images.apple.com/v/watch/k/images/overview/watch_03_large.jpg", isTopOne: true)
        
        let downloadB = getOperation(name: "下载线程B", imageUrl: "http://images.apple.com/v/watch/k/images/overview/watch_05_large.jpg", isTopOne: false)
        
        let queue = OperationQueue()
        queue.maxConcurrentOperationCount = 1
        queue.addOperation(downloadA)
        queue.addOperation(downloadB)
        
        for operation in queue.operations{
            print("Operation名称:"+operation.name!)
        }
    }
    
    func getOperation(name : String, imageUrl : String, isTopOne : Bool) -> BlockOperation{
        let download = BlockOperation(block: {
            let url = URL(string: imageUrl)
            var data : Data!
            do{
                Thread.sleep(forTimeInterval: 1.0)
                try data = Data(contentsOf: url!)
                let image = UIImage(data: data)
                if isTopOne{
                    self.perform(#selector(ViewController.showTopImage), on: Thread.main, with: image, waitUntilDone: true)
                }
                else{
                    self.perform(#selector(ViewController.showFootImage), on: Thread.main, with: image, waitUntilDone: true)
                }
            }catch{
                print("下载图片失败。")
            }
        })
        download.name = name
        return download
    }
    
    @objc func showTopImage(image : UIImage){
        self.topImageView.image = image
    }
    
    @objc func showFootImage(image : UIImage){
        self.footImageView.image = image
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

