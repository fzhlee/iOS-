//
//  ViewController.swift
//  10.3.1VideoPlayer_AVPlayerViewController
//
//  Created by Jerry on 16/7/16.
//  Copyright © 2016年 www.coolketang.com. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let moviePath = Bundle.main.path(forResource: "Sunrise", ofType: "mp4")
        let movieURL = URL(fileURLWithPath: moviePath!)
        
        let avPlayer = AVPlayer(url: movieURL as URL)
        let playerVC = AVPlayerViewController()
        playerVC.player = avPlayer
        playerVC.videoGravity = AVLayerVideoGravityResizeAspect;
        playerVC.allowsPictureInPicturePlayback = true
        playerVC.showsPlaybackControls = true
        playerVC.view.frame = self.view.bounds
        
        playerVC.player!.play()
        self.view.addSubview(playerVC.view);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

