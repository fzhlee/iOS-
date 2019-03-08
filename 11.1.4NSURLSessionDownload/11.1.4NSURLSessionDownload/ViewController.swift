//
//  ViewController.swift
//  11.1.4NSURLSessionDownload
//
//  Created by Jerry on 2018/3/15.
//  Copyright © 2018年 www.coolketang.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController, URLSessionDownloadDelegate {
    
    var backgroundView : UIView!
    var foregroundView : UIView!
    var progressLabel : UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        backgroundView = UIView(frame:CGRect(x: 16, y: 106, width: 288, height: 44))
        backgroundView.backgroundColor = UIColor.lightGray
        
        foregroundView = UIView(frame:CGRect(x: 20, y: 110, width: 0, height: 36))
        foregroundView.backgroundColor = UIColor.green
        
        progressLabel = UILabel(frame:CGRect(x: 20, y: 160, width: 280, height: 36))
        progressLabel.textAlignment = NSTextAlignment.center
        
        self.view.addSubview(backgroundView)
        self.view.addSubview(foregroundView)
        self.view.addSubview(progressLabel)
        
        let url = URL(string: "https://coolketang.com/images/img_bg_1.jpg")
        let request:URLRequest = URLRequest(url: url!)
        
        let urlSession = self.buildSession() as Foundation.URLSession
        let task = urlSession.downloadTask(with: request)
        task.resume()
    }

    func buildSession() -> Foundation.URLSession
    {
        var session:URLSession? = nil
        let config = URLSessionConfiguration.default
        session = URLSession(configuration: config, delegate: self, delegateQueue: nil)
        
        return session!
    }
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask,
                    didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64)
    {
        let rate:CGFloat = CGFloat(totalBytesWritten)/CGFloat(totalBytesExpectedToWrite)
        DispatchQueue.main.async(execute: {   () in
            self.foregroundView.frame.size.width = rate * 280
            if rate == 1.0
            {
                self.progressLabel.text = "Finished 😝"
            }
        })
    }
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask,
                    didFinishDownloadingTo location: URL)
    {
        do
        {
            let originalPath = location.path
            print("Original location:\(originalPath)")
            
            let targetPath:String = NSHomeDirectory() + "/Documents/background.png"
            
            let fileManager:FileManager = FileManager.default
            if !fileManager.fileExists(atPath: targetPath)
            {
                try fileManager.moveItem(atPath: originalPath, toPath: targetPath)
                print("new location:\(targetPath)")
            }
        }
        catch
        {
            print("FileManager  error.")
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

