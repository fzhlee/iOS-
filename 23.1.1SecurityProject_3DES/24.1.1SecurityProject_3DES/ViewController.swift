//
//  ViewController.swift
//  24.1.1SecurityProject_3DES
//
//  Created by Jerry on 16/7/21.
//  Copyright © 2016年 www.coolketang.com. All rights reserved.
//

import UIKit

private let randomStringArray: [Character] = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789".map({$0})

class ViewController: UIViewController {
    var key:String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        encrypt(encryptData: "coolketang.com");
    }

    func encrypt(encryptData:String){
        key = randomStringOfLength(kCCKeySize3DES)
        let inputData : Data = encryptData.data(using: String.Encoding.utf8)!
        let keyData: Data = key.data(using: String.Encoding.utf8, allowLossyConversion: false)!
        let keyBytes = UnsafeMutableRawPointer(mutating: (keyData as NSData).bytes)
        let keyLength = size_t(kCCKeySize3DES)
        let dataLength = Int(inputData.count)
        let dataBytes = UnsafeRawPointer((inputData as NSData).bytes)
        let bufferData = NSMutableData(length: Int(dataLength) + kCCBlockSize3DES)!
        let bufferPointer = UnsafeMutableRawPointer(bufferData.mutableBytes)
        let bufferLength = size_t(bufferData.length)
        var bytesDecrypted = Int(0)
        
        let cryptStatus = CCCrypt(
            UInt32(kCCEncrypt),                  // Operation
            UInt32(kCCAlgorithm3DES),    // Algorithm
            UInt32(kCCOptionECBMode + kCCOptionPKCS7Padding),                    // Options
            keyBytes,                   // key data
            keyLength,                  // key length
            nil,                   // IV buffer
            dataBytes,                  // input data
            dataLength,                 // input length
            bufferPointer,              // output buffer
            bufferLength,               // output buffer length
            &bytesDecrypted)            // output bytes decrypted real length
        if Int32(cryptStatus) == Int32(kCCSuccess) {
            bufferData.length = bytesDecrypted // Adjust buffer size to real bytes
            decrypt(inputData: bufferData as Data)
            
        } else {
            print("加密过程出错: \(cryptStatus)")
        }
    }
    
    func decrypt(inputData : Data){
        let keyData: Data = key.data(using: String.Encoding.utf8, allowLossyConversion: false)!
        let keyBytes         = UnsafeMutableRawPointer(mutating: (keyData as NSData).bytes)
        let keyLength        = size_t(kCCKeySize3DES)
        let dataLength       = Int(inputData.count)
        let dataBytes        = UnsafeRawPointer((inputData as NSData).bytes)
        let bufferData       = NSMutableData(length: Int(dataLength) + kCCBlockSize3DES)!
        let bufferPointer    = UnsafeMutableRawPointer(bufferData.mutableBytes)
        let bufferLength     = size_t(bufferData.length)
        var bytesDecrypted   = Int(0)
        
        let cryptStatus = CCCrypt(
            UInt32(kCCDecrypt),                  // Operation
            UInt32(kCCAlgorithm3DES),    // Algorithm
            UInt32(kCCOptionECBMode + kCCOptionPKCS7Padding),                    // Options
            keyBytes,                   // key data
            keyLength,                  // key length
            nil,                   // IV buffer
            dataBytes,                  // input data
            dataLength,                 // input length
            bufferPointer,              // output buffer
            bufferLength,               // output buffer length
            &bytesDecrypted)            // output bytes decrypted real length
        if Int32(cryptStatus) == Int32(kCCSuccess) {
            bufferData.length = bytesDecrypted // Adjust buffer size to real bytes
            //print(bufferData)
            let clearDataAsString = NSString(data: bufferData as Data, encoding: String.Encoding.utf8.rawValue)
            print("解密后的内容：\(clearDataAsString! as String)");
        } else {
            print("Error in crypto operation: \(cryptStatus)")
        }
    }
    
    func randomStringOfLength(_ length:Int) -> String {
        var string = ""
        for _ in (1...length) {
            string.append(randomStringArray[Int(arc4random_uniform(UInt32(randomStringArray.count) - 1))])
        }
        return string
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

