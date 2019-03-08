//
//  ViewController.swift
//  UIViewProject05_Animation
//
//  Created by Jerry on 16/5/27.
//  Copyright © 2016年 www.coolketang.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let rect = CGRect(x: 40, y: 80, width: 240, height: 240)
        let view = UIView(frame: rect)
        view.backgroundColor = UIColor.red
        view.tag = 1
        
        self.view.addSubview(view)
        
        let button = UIButton(type: UIButtonType.system)
        button.frame = CGRect(x: 40, y: 400, width: 240, height: 44)
        button.backgroundColor = UIColor.black
        button.setTitle("Play", for: UIControlState())
        button.titleLabel?.font = UIFont(name: "Arial", size: 24)
        button.addTarget(self, action: #selector(ViewController.playAnimation), for: UIControlEvents.touchUpInside)
        
        self.view.addSubview(button)
    }
    @objc func playAnimation()
    {
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationCurve(.easeOut)
        UIView.setAnimationDuration(5)
        UIView.setAnimationBeginsFromCurrentState(true)
        
        let view = self.view.viewWithTag(1)
//        view?.frame = CGRect(x: 40, y: 40, width: 0, height: 0)
//        view?.backgroundColor = UIColor.blue
//        view?.alpha = 0
//
        UIView.setAnimationTransition(.curlUp, for: view!, cache: true)
        
        UIView.setAnimationDelegate(self)
        UIView.setAnimationDidStop(#selector(ViewController.animationStop))
        UIView.commitAnimations()
    }
    
    @objc func animationStop()
    {
        print("Animaton stop.")
        self.view.viewWithTag(1)?.removeFromSuperview()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

