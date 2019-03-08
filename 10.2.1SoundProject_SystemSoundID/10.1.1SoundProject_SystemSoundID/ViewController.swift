//
//  ViewController.swift
//  10.1.1SoundProject_SystemSoundID
//
//  Created by Jerry on 16/7/15.
//  Copyright © 2016年 www.coolketang.com. All rights reserved.
//

import UIKit
import AudioToolbox

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var _soundId:SystemSoundID = 0
        let path = Bundle.main.path(forResource: "camera", ofType: "wav")
        let soundUrl = URL(fileURLWithPath: path!)
        AudioServicesCreateSystemSoundID(soundUrl as CFURL, &_soundId)
        
        AudioServicesAddSystemSoundCompletion(_soundId, nil, nil, { (soundID, clientData) -> Void in
            
            print("音频播放结束之后，重复音频的播放。。。")
            AudioServicesPlaySystemSound(soundID)
            
            }, nil)
        AudioServicesPlaySystemSound(_soundId)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

