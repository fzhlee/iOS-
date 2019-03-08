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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    func downloadImage()
    {
        Alamofire.request("https://httpbin.org/image/png").responseImage
        { response in
            debugPrint(response)
            
            print(response.request)
            print(response.response)
            debugPrint(response.result)
            
            if let image = response.result.value
            {
                print("image downloaded: \(image)")
                
                let size = self.view.bounds.size
                self.imageView = UIImageView(image: image)
                self.imageView?.center = CGPoint(x: size.width/2, y: size.height/2)
                
                self.view.addSubview(self.imageView!)
            }
        }
    }
    
    func inflationImage()
    {
        let url = Bundle.main.url(forResource: "Girl", withExtension: "png")!
        let data = try! Data(contentsOf: url)
        let image = UIImage(data: data, scale: UIScreen.main.scale)!
        
        image.af_inflate()
        
        let size = self.view.bounds.size
        self.imageView = UIImageView(image: image)
        self.imageView?.center = CGPoint(x: size.width/2, y: size.height/2)
        self.view.addSubview(self.imageView!)
    }
    
    func scalingImage()
    {
        let image = UIImage(named: "Girl")!
        let imageSize = CGSize(width: 100, height: 100)
        
        //let scaledImage = image.af_imageScaled(to: imageSize)
        //let aspectScaledToFitImage = image.af_imageAspectScaled(toFit: imageSize)
        let aspectScaledToFillImage = image.af_imageAspectScaled(toFill: imageSize)
        
        let size = self.view.bounds.size
        self.imageView = UIImageView(image: aspectScaledToFillImage)
        self.imageView?.center = CGPoint(x: size.width/2, y: size.height/2)
        self.view.addSubview(self.imageView!)
    }
    
    func roundedCorners()
    {
        let image = UIImage(named: "Giraffe")!
        let radius: CGFloat = 20.0
        
        let roundedImage = image.af_imageRounded(withCornerRadius: radius)
        //let circularImage = image.af_imageRoundedIntoCircle()
        
        let size = self.view.bounds.size
        self.imageView = UIImageView(image: roundedImage)
        self.imageView?.center = CGPoint(x: size.width/2, y: size.height/2)
        self.view.addSubview(self.imageView!)
    }
    
    func coreImageFilters()
    {
        let image = UIImage(named: "Family")!
        
        //let sepiaImage = image.af_imageFiltered(withCoreImageFilter: "CISepiaTone")
        let blurredImage = image.af_imageFiltered(
            withCoreImageFilter: "CIMotionBlur",
            parameters: ["inputRadius": 10,"inputAngle":45]
        )
        
        let size = self.view.bounds.size
        self.imageView = UIImageView(image: blurredImage)
        self.imageView?.center = CGPoint(x: size.width/2, y: size.height/2)
        
        self.view.addSubview(self.imageView!)
    }
    
    func cacheImages()
    {
        let imageCache = AutoPurgingImageCache(
            memoryCapacity: 100_000_000,
            preferredMemoryUsageAfterPurge: 60_000_000
        )
        
        let urlRequest = URLRequest(url: URL(string: "https://httpbin.org/image/png")!)
        
        Alamofire.request("https://httpbin.org/image/png").responseImage
        { response in
            
            if let image = response.result.value
            {
                imageCache.add(image, for: urlRequest, withIdentifier: "circleImage")
                
                let cachedAvatarImage = imageCache.image(for: urlRequest, withIdentifier: "circleImage")
                
                let size = self.view.bounds.size
                self.imageView = UIImageView(image: cachedAvatarImage)
                self.imageView?.center = CGPoint(x: size.width/2, y: size.height/2)
                self.view.addSubview(self.imageView!)
                
                imageCache.removeImage(for: urlRequest, withIdentifier: "circleImage")
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
