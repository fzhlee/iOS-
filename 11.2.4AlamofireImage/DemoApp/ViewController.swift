//
//  ViewController.swift
//  DemoApp
//
//  Created by LiFazhan on 2017/1/10.
//  Copyright © 2017 www.coolketang.com. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class ViewController: UIViewController {
    
    var imageView : UIImageView?
    var imageCache : AutoPurgingImageCache!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        coreImageFilters()
    }
    
    func scalingImage()
    {
        let image = UIImage(named: "Girl")!
        let imageSize = CGSize(width: 200, height: 200)
        
//        let scaledImage = image.af_imageScaled(to: imageSize)
//        let aspectScaledToFitImage = image.af_imageAspectScaled(toFit: imageSize)
        let aspectScaledToFillImage = image.af_imageAspectScaled(toFill: imageSize)
        
        self.imageView = UIImageView(image: aspectScaledToFillImage)
        self.imageView?.center = self.view.center
        self.view.addSubview(self.imageView!)
    }
    
    func coreImageFilters()
    {
        let image = UIImage(named: "Family")!
        let blurredImage = image.af_imageFiltered(
            withCoreImageFilter: "CIMotionBlur",
            parameters: ["inputRadius": 5,"inputAngle":45]
        )
        
        self.imageView = UIImageView(image: blurredImage)
        self.imageView?.center = self.view.center
        self.view.addSubview(self.imageView!)
    }
    
    func cacheImages()
    {
        Alamofire.request("https://www.coolketang.com/banner/banner_swift.png").responseImage
        { response in
            self.imageCache = AutoPurgingImageCache(
                memoryCapacity: 100_000_000,
                preferredMemoryUsageAfterPurge: 60_000_000
            )
            if let image = response.result.value
            {
                self.imageCache.add(image, withIdentifier: "circleImage")
            }
            let cachedAvatarImage = self.imageCache.image(withIdentifier: "circleImage")
            if let avarta = cachedAvatarImage
            {
                self.imageView = UIImageView(image: avarta)
                self.imageView?.center = self.view.center
                self.view.addSubview(self.imageView!)
            }
            
            let button = UIButton(frame: CGRect(x: 0, y: 420, width: 320, height: 40))
            button.setTitle("获取内存中缓存的图片", for: .normal)
            button.addTarget(self, action: #selector(self.getCachedImage), for: .touchUpInside)
            button.backgroundColor = .orange
            self.view.addSubview(button)
//            imageCache.removeImage(withIdentifier: "circleImage")
            
        }
    }

    func getCachedImage()
    {
        let cachedAvatarImage = self.imageCache.image(withIdentifier: "circleImage")
        if let avarta = cachedAvatarImage
        {
            let imageView = UIImageView(image: avarta)
            imageView.center = CGPoint(x: 160, y: 150)
            self.view.addSubview(imageView)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
