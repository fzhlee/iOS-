//
//  CustomPageViewController.swift
//  DemoApp
//
//  Created by LiFazhan on 17/1/20.
//  Copyright © 2017 www.coolketang.com. All rights reserved.
//

import UIKit

class CustomPageViewController: UIViewController,BWWalkthroughPage {
    
    @IBOutlet var imageView:UIImageView?
    @IBOutlet var titleLabel:UILabel?
    @IBOutlet var textLabel:UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
    }
    func walkthroughDidScroll(_ position: CGFloat, offset: CGFloat)
    {
        var tr = CATransform3DIdentity
        tr.m34 = -1/500.0
        
        titleLabel?.layer.transform = CATransform3DRotate(tr, CGFloat(Double.pi) * (1.0 - offset), 1, 1, 1)
        textLabel?.layer.transform = CATransform3DRotate(tr, CGFloat(Double.pi) * (1.0 - offset), 1, 1, 1)
        
        var tmpOffset = offset
        if tmpOffset > 1.0
        {
            tmpOffset = 1.0 + (1.0 - tmpOffset)
        }
        
        imageView?.layer.transform = CATransform3DTranslate(tr, 0 , (1.0 - tmpOffset) * 200, 0)
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
