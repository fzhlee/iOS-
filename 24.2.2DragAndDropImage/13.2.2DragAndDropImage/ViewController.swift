//
//  ViewController.swift
//  13.2.2DragAndDropImage
//
//  Created by Jerry on 2018/3/17.
//  Copyright © 2018年 www.coolketang.com. All rights reserved.
//

import UIKit

class PlaceHolderImageView : UIImageView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func paste(itemProviders: [NSItemProvider]) {
        for dragItem in itemProviders {
            if dragItem.canLoadObject(ofClass: UIImage.self) {
                dragItem.loadObject(ofClass: UIImage.self, completionHandler: { (image, error) in
                    if image != nil {
                        DispatchQueue.main.async {
                            self.image = (image as! UIImage)
                        }
                    }
                })
            }
        }
    }
}

class ViewController: UIViewController, UIDragInteractionDelegate, UIDropInteractionDelegate {

    var draggingImageView : UIImageView!
    var droppingImageView : UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let background = UIImageView(image: UIImage(named: "bg"))
        background.frame = CGRect(x: 0, y: 300, width: 1200, height: 428)
        self.view.addSubview(background)
        
        draggingImageView = UIImageView(image: UIImage(named: "where"))
        draggingImageView.frame = CGRect(x: 200, y: 100, width: 141, height: 125)
        draggingImageView.isUserInteractionEnabled = true
        draggingImageView.addInteraction(UIDragInteraction.init(delegate: self))
        self.view.addSubview(draggingImageView)
        
        let imgPlaceHolder = UIImage(named: "placeHolder")
        let pastingImageView = PlaceHolderImageView(frame: CGRect(x: 430, y: 420, width: 141, height: 125))
        pastingImageView.image = imgPlaceHolder
        pastingImageView.isUserInteractionEnabled = true
        pastingImageView.pasteConfiguration = UIPasteConfiguration(forAccepting: UIImage.self)
        self.view.addSubview(pastingImageView)
        
        droppingImageView = UIImageView(frame: CGRect(x: 500, y: 100, width: 141, height: 125))
        droppingImageView.image = imgPlaceHolder
        droppingImageView.isUserInteractionEnabled = true
        droppingImageView.addInteraction(UIDropInteraction.init(delegate: self))
        self.view.addSubview(droppingImageView)
    }
    
    func dragInteraction(_ interaction: UIDragInteraction, itemsForBeginning session: UIDragSession) -> [UIDragItem] {
        if interaction.view == draggingImageView {
            let dragImage = draggingImageView.image
            let itemProvider = NSItemProvider.init(object: dragImage!)
            let dragItem = UIDragItem.init(itemProvider: itemProvider)
            return [dragItem]
        }
        return []
    }
    
    func dropInteraction(_ interaction: UIDropInteraction, sessionDidUpdate session: UIDropSession) -> UIDropProposal {
        let proposal = UIDropProposal.init(operation: UIDropOperation.copy)
        return proposal
    }
    
    func dropInteraction(_ interaction: UIDropInteraction, performDrop session: UIDropSession) {
        if interaction.view == droppingImageView {
            DispatchQueue.main.async {
                self.droppingImageView.image = self.draggingImageView.image
            }
            
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

