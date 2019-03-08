//
//  ViewController.swift
//  CoreImageProject
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
        
        let option = Dictionary(dictionaryLiteral: (kCIContextUseSoftwareRenderer, true))
        let context = CIContext(options: option)
        let image = UIImage(named: "Pic1")
        let imageView = UIImageView(image: image)
        
        let filter = CIFilter(name: "CIColorMonochrome")
        let ciImage = CIImage(image: image!)
        let color = CIColor(red: 0.8, green: 0.6, blue: 0.4)
        filter?.setValue(color, forKey: kCIInputColorKey)
        filter?.setValue(1.0, forKey: kCIInputIntensityKey)
        filter?.setValue(ciImage, forKey: kCIInputImageKey)
        
        let resltImage = filter?.outputImage
        let outImage = context.createCGImage((filter?.outputImage)!, from: (resltImage?.extent)!)
        imageView.image = UIImage(cgImage: outImage!)
        self.view.addSubview(imageView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

