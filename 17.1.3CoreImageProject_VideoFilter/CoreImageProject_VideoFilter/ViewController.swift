//
//  ViewController.swift
//  CoreImageProject_VideoFilter
//
//  Created by Jerry on 16/6/21.
//  Copyright © 2016年 www.coolketang.com. All rights reserved.
//

import UIKit
import CoreImage
import AVFoundation

class ViewController: UIViewController, AVCaptureVideoDataOutputSampleBufferDelegate{
    
    var filter: CIFilter!
    var ciImage: CIImage!
    var videoLayer: CALayer!
    var imageView : UIImageView!
    var avCaptureSession: AVCaptureSession!
    var context: CIContext = {
        return CIContext(eaglContext: EAGLContext(api: EAGLRenderingAPI.openGLES2)!, options: nil)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        filter = CIFilter(name: "CIPhotoEffectTransfer")
        buildUI()
        buildSession()
    }
    
    func buildUI()
    {
        videoLayer = CALayer()
        videoLayer.anchorPoint = CGPoint.zero
        videoLayer.bounds = view.bounds
        self.view.layer.insertSublayer(videoLayer, at: 0)
        
        imageView = UIImageView(frame: view.bounds)
        self.view.addSubview(imageView)
        
        let button = UIButton(frame: CGRect(x: 0, y: 420, width: 320, height: 60))
        button.setTitle("截取图片", for: .normal)
        button.backgroundColor = UIColor.black
        button.addTarget(self, action: #selector(ViewController.captureScreen), for: .touchUpInside)
        self.view.addSubview(button)
    }
    
    func buildSession() {
        avCaptureSession = AVCaptureSession()
        avCaptureSession.beginConfiguration()
        avCaptureSession.sessionPreset = AVCaptureSession.Preset.high
        
        let captureDevice = AVCaptureDevice.default(for: AVMediaType.video)
        let deviceInput = try! AVCaptureDeviceInput(device: captureDevice!)
        if avCaptureSession.canAddInput(deviceInput)
        {
            avCaptureSession.addInput(deviceInput)
        }
        
        let dataOutput = AVCaptureVideoDataOutput()
        dataOutput.videoSettings = [kCVPixelBufferPixelFormatTypeKey as AnyHashable : Int(kCVPixelFormatType_32BGRA)] as! [String : Any]
        dataOutput.alwaysDiscardsLateVideoFrames = true
        if avCaptureSession.canAddOutput(dataOutput)
        {
            avCaptureSession.addOutput(dataOutput)
        }
        
        let queue = DispatchQueue(label: "VideoQueue", attributes: .concurrent)
        dataOutput.setSampleBufferDelegate(self, queue: queue)
        
        avCaptureSession.commitConfiguration()
        avCaptureSession.startRunning()
    }
    
    func captureOutput(_ captureOutput: AVCaptureOutput!,didOutputSampleBuffer sampleBuffer: CMSampleBuffer!,from connection: AVCaptureConnection!) {
        autoreleasepool {
            let imgBuffer = CMSampleBufferGetImageBuffer(sampleBuffer)!
            var ciImage = CIImage(cvPixelBuffer: imgBuffer)
            
            self.filter.setValue(ciImage, forKey: kCIInputImageKey)
            ciImage = self.filter.outputImage!

            let orientation = UIDevice.current.orientation
            if orientation == UIDeviceOrientation.portrait
            {
                ciImage = ciImage.transformed(by: CGAffineTransform(rotationAngle: CGFloat(Double.pi / -2.0)))
            }
            else if orientation == UIDeviceOrientation.portraitUpsideDown
            {
                ciImage = ciImage.transformed(by: CGAffineTransform(rotationAngle: CGFloat(Double.pi / 2.0)))
            }
            else if (orientation == UIDeviceOrientation.landscapeRight)
            {
                ciImage = ciImage.transformed(by: CGAffineTransform(rotationAngle: CGFloat(Double.pi)))
            }
            
            self.ciImage = ciImage
            let cgImage = self.context.createCGImage(ciImage, from: ciImage.extent)
            
            DispatchQueue.main.sync(execute: {
                self.videoLayer.contents = cgImage
            })
        }
    }
    
    @objc func captureScreen(_ sender: UIButton)
    {
        avCaptureSession.stopRunning()
        videoLayer.removeFromSuperlayer()
        sender.isHidden = true
        
        imageView.image = UIImage(ciImage: self.ciImage)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

