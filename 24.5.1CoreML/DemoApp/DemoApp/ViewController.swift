//
//  ViewController.swift
//  DemoApp
//
//  Created by Jerry on 2017/7/3.
//  Copyright © 2017 www.coolketang.com. All rights reserved.
//

import UIKit
import CoreML

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let image = UIImage(named: "sample")
        
        let width : CGFloat = 224.0
        let height : CGFloat = 224.0
        
        UIGraphicsBeginImageContext(CGSize(width: width, height: height))
        image?.draw(in:CGRect(x: 0, y: 0, width: width, height: height))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        if #available(iOS 11.0, *)
        {
            let resnet50 = Resnet50()
            
            guard let output = try? resnet50.prediction(image:pixelBufferFrom(image: newImage!)) else
            {
                fatalError("Unexpected error.")
            }
            
            print(output.classLabel)
        }
    }
    
    
    func pixelBufferFrom(image: UIImage) -> CVPixelBuffer
    {
        let ciContext = CIContext(options: nil)
        let ciImage = CIImage(image: image)
        let cgImage = ciContext.createCGImage(ciImage!, from: ciImage!.extent)
        
        let umPointer = UnsafeMutablePointer<UnsafeRawPointer>.allocate(capacity: 1)
        let cfNum = CFNumberCreate(kCFAllocatorDefault, .intType, umPointer)
        let values: [CFTypeRef] = [kCFBooleanTrue, kCFBooleanTrue, cfNum!]
        let keysPointer = UnsafeMutablePointer<UnsafeRawPointer?>.allocate(capacity: 1)
        let valuesPointer =  UnsafeMutablePointer<UnsafeRawPointer?>.allocate(capacity: 1)
        
        let keys: [CFString] = [kCVPixelBufferCGImageCompatibilityKey, kCVPixelBufferCGBitmapContextCompatibilityKey, kCVPixelBufferBytesPerRowAlignmentKey]
        keysPointer.initialize(to: keys)
        valuesPointer.initialize(to: values)
        
        let options = CFDictionaryCreate(kCFAllocatorDefault, keysPointer, valuesPointer, keys.count, nil, nil)
        var pxbuffer: CVPixelBuffer?
        var status = CVPixelBufferCreate(kCFAllocatorDefault, cgImage!.width, cgImage!.height,
                                         kCVPixelFormatType_32BGRA, options, &pxbuffer)
        status = CVPixelBufferLockBaseAddress(pxbuffer!, CVPixelBufferLockFlags(rawValue: 0));
        
        let bufferAddress = CVPixelBufferGetBaseAddress(pxbuffer!);
        let rgbColorSpace = CGColorSpaceCreateDeviceRGB();
        let bytesperrow = CVPixelBufferGetBytesPerRow(pxbuffer!)
        let context = CGContext(data: bufferAddress,
                                width: cgImage!.width,
                                height: cgImage!.height,
                                bitsPerComponent: 8,
                                bytesPerRow: bytesperrow,
                                space: rgbColorSpace,
                                bitmapInfo: CGImageAlphaInfo.premultipliedFirst.rawValue | CGBitmapInfo.byteOrder32Little.rawValue);
        context?.concatenate(CGAffineTransform(rotationAngle: 0))
        context?.concatenate(__CGAffineTransformMake( 1, 0, 0, -1, 0, CGFloat(cgImage!.height) ))
        
        context?.draw(cgImage!, in: CGRect(x:0, y:0, width:CGFloat(cgImage!.width), height:CGFloat(cgImage!.height)));
        status = CVPixelBufferUnlockBaseAddress(pxbuffer!, CVPixelBufferLockFlags(rawValue: 0));
        return pxbuffer!;
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

