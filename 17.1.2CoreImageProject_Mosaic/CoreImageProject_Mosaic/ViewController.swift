//
//  ViewController.swift
//  CoreImageProject_Mosaic
//
//  Created by Jerry on 16/6/21.
//  Copyright © 2016年 www.coolketang.com. All rights reserved.
//

import UIKit
import CoreImage

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let image = UIImage(named: "Pic1")
        let imageView = UIImageView(image: image)
        self.view.addSubview(imageView)
        
        let ciImage = CIImage(image: image!)
        let filter = CIFilter(name: "CIPixellate")
        filter?.setDefaults()
        filter?.setValue(ciImage, forKey: kCIInputImageKey)
        let outImage = filter?.outputImage
        imageView.image = UIImage(ciImage:outImage!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

