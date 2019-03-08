//
//  ViewController.swift
//  10.2.1SoundProject_AudioPlayer
//
//  Created by Jerry on 16/7/16.
//  Copyright © 2016年 www.coolketang.com. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate {
    
    var audioPlayer:AVAudioPlayer = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let path = Bundle.main.path(forResource: "music", ofType: "mp3")
        let soundUrl = URL(fileURLWithPath: path!)
        
        do{
            try audioPlayer = AVAudioPlayer(contentsOf: soundUrl)
            audioPlayer.volume = 1.0
            audioPlayer.numberOfLoops = -1
            audioPlayer.delegate = self
            audioPlayer.play()
        } catch{
            print(error)
        }
        
        let stopMusic = UIButton(frame: CGRect(x: 20, y: 80, width: 280, height: 44))
        stopMusic.backgroundColor = UIColor.purple
        stopMusic.setTitle("暂停/恢复音乐", for: UIControlState.init(rawValue: 0))
        stopMusic.addTarget(self, action: #selector(ViewController.pauseOrResumeMusic), for: .touchUpInside)
        self.view.addSubview(stopMusic)
    }
    @objc func pauseOrResumeMusic(){
        if self.audioPlayer.isPlaying {
            self.audioPlayer.pause()
        }
        else{
            self.audioPlayer.play()
        }
    }
    func audioPlayerBeginInterruption(_ player: AVAudioPlayer) {
        print("音乐播放被打断。")
    }
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        print("音乐播放完毕。");
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
