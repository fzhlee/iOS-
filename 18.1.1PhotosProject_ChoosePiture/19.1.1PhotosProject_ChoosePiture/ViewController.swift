//
//  ViewController.swift
//  19.1.1PhotosProject_LoadPicture
//
//  Created by Jerry on 18/7/19.
//  Copyright © 2018年 www.coolketang.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var imageView: UIImageView!
    var imagePickerController: UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.imageView = UIImageView(frame: CGRect(x: 20, y: 120, width: 280, height: 200))
        self.view.addSubview(imageView)
        
        let button = UIButton(frame: CGRect(x: 20, y: 60, width: 280, height: 40))
        button.setTitle("选择一张图片", for: UIControlState())
        button.addTarget(self, action: #selector(ViewController.pickImage), for: UIControlEvents.touchUpInside)
        button.backgroundColor = UIColor.darkGray
        
        self.view.addSubview(button)
    }
    
    @objc func pickImage(){
        self.imagePickerController = UIImagePickerController()
        self.imagePickerController.delegate = self
        self.imagePickerController.allowsEditing = true
        self.imagePickerController.sourceType = UIImagePickerControllerSourceType.photoLibrary
        self.imagePickerController.navigationBar.barTintColor = UIColor.orange
        self.imagePickerController.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        self.imagePickerController.navigationBar.tintColor = UIColor.white
        self.present(self.imagePickerController, animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        print(info["UIImagePickerControllerMediaType"] as Any)
        print(info["UIImagePickerControllerCropRect"] as Any)
        print(info["UIImagePickerControllerReferenceURL"] as Any)
        self.imageView.image = info["UIImagePickerControllerEditedImage"] as? UIImage
        self.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
