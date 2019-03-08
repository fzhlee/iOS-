//
//  ViewController.swift
//  10.3.1VideoPlayer_AVPlayer
//
//  Created by Jerry on 16/7/16.
//  Copyright © 2016年 www.coolketang.com. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let moviePath = Bundle.main.path(forResource: "movie", ofType: "mp4")
        let movieURL = URL(fileURLWithPath: moviePath!)
        
        let avPlayer = AVPlayer(url: movieURL as URL)
        let avPlayerLayer = AVPlayerLayer(player: avPlayer)
        avPlayerLayer.frame = self.view.bounds
        avPlayerLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
        self.view.layer.addSublayer(avPlayerLayer)
        
        avPlayer.play()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

