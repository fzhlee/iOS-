//
//  ViewController.swift
//  15.2.1MultiTread_Thread
//
//  Created by Jerry on 16/7/25.
//  Copyright © 2016年 www.coolketang.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var imageView : UIImageView!
    var label : UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        imageView = UIImageView(frame: CGRect(x: 0, y: 120, width: 320, height: 300))
        self.view.addSubview(imageView)
        
        label = UILabel(frame: CGRect(x: 0, y: 120, width: 320, height: 300))
        label.backgroundColor = UIColor.lightGray
        label.textAlignment = .center
        label.text = "Loading..."
        label.font = UIFont.systemFont(ofSize: 42)
        self.view.addSubview(label)
        
        let imageUrl = "http://images.apple.com/v/iphone/home/s/home/images/trade_in_iphone_large_2x.jpg"
        let thread = Thread(target: self, selector: #selector(ViewController.downloadImage), object: imageUrl)
        thread.start()
    }
    
    @objc func downloadImage(path : String){
        let url = URL(string: path)
        var data : Data!
        do{
            try data = Data(contentsOf: url!)
            let image = UIImage(data: data)
            self.perform(#selector(ViewController.showImage), on: Thread.main, with: image, waitUntilDone: true)
        }catch{
            print("下载图片失败。")
        }
    }
    
    @objc func showImage(image : UIImage){
        self.imageView.image = image
        self.label.isHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

