//
//  BaseViewController.swift
//  DemoApp
//
//  Created by Jerry on 2017/3/28.
//  Copyright © 2017年 www.coolketang.com. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    var gradientLayer = CAGradientLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setNormalBackground()
        self.view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    func setNormalBackground()
    {
        //渐变背景
        gradientLayer.bounds = CGRect(x: 0, y: 0, width: WIDTHFULL+1, height: HEIGHTFULL+1)
        gradientLayer.position = CGPoint(x: WIDTHFULL/2, y: HEIGHTFULL/2)
        gradientLayer.colors = [UIColor(red: 139.0/255, green: 120.0/255, blue: 186.0/255, alpha: 1.0).cgColor,
                                UIColor(red: 147.0/255, green: 193.0/255, blue: 207.0/255, alpha: 1.0).cgColor]
        
        gradientLayer.startPoint = CGPoint(x: 1, y: 1)
        gradientLayer.endPoint = CGPoint(x: 0, y: 0)
        //gradientLayer.transform = CATransform3DMakeRotation(CGFloat.pi / 4, 0, 0, 1)
    }
    
    func setMaskBackground()
    {
        let heightFull = Int(self.view.frame.size.height)
        let widthFull = Int(self.view.frame.size.width)
        
        //渐变背景
        gradientLayer.bounds = CGRect(x: 0, y: 0, width: WIDTHFULL+1, height: HEIGHTFULL+1)
        gradientLayer.position = CGPoint(x: WIDTHFULL/2, y: HEIGHTFULL/2)
        gradientLayer.colors = [UIColor(red: 49.0/255, green: 30.0/255, blue: 96.0/255, alpha: 1.0).cgColor,
                                UIColor(red: 57.0/255, green: 103.0/255, blue: 117.0/255, alpha: 1.0).cgColor]
        
        gradientLayer.startPoint = CGPoint(x: 1, y: 1)
        gradientLayer.endPoint = CGPoint(x: 0, y: 0)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
