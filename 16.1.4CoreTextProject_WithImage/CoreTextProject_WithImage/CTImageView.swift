//
//  CTImageView.swift
//  CoreTextProject_WithImage
//
//  Created by Jerry on 18/6/23.
//  Copyright © 2018 www.coolketang.com. All rights reserved.
//

import UIKit
let picWidth = CGFloat(200.0)
let picHeight = CGFloat(133.0)

class CTImageView: UIView {

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        UIColor.brown.setFill()
        UIRectFill(rect)
        
        var  ctRunCallback =  CTRunDelegateCallbacks(version: kCTRunDelegateVersion1, dealloc: { (refCon) -> Void in
            }, getAscent: { ( refCon) -> CGFloat in
                return picHeight
            }, getDescent: { (refCon) -> CGFloat in
                return 0
            }) { (refCon) -> CGFloat in
                return picWidth
        }
        
        var picture = "coffee"
        let ctRunDelegate  = CTRunDelegateCreate(&ctRunCallback, &picture)
        let placeHolder = NSMutableAttributedString(string: " ")
        placeHolder.addAttribute(NSAttributedStringKey(rawValue: kCTRunDelegateAttributeName as String), value: ctRunDelegate!, range: NSMakeRange(0, 1))
        placeHolder.addAttribute(NSAttributedStringKey(rawValue: "pictureName"), value: picture, range: NSMakeRange(0, 1))
        
        let article = "咖啡（coffee）是采用经过烘焙的咖啡豆所制作出来\n\n的饮料，通常为热饮，但也有作为冷饮的冰咖啡。咖啡是人类社会流行范围最为广泛的饮料之一,也是重要经济作物。在繁忙的工作生活之余，我们可以去尝试做自己的咖啡。"
        let attributedStr = NSMutableAttributedString(string: article)
        attributedStr.insert(placeHolder, at: 27)
        attributedStr.addAttribute(NSAttributedStringKey(rawValue: kCTUnderlineStyleAttributeName as String), value: NSNumber(value: 1), range: NSRange(location: 0, length: attributedStr.length))
        
        let framesetter = CTFramesetterCreateWithAttributedString(attributedStr)
        let path = UIBezierPath(rect: rect)
        let ctFrame = CTFramesetterCreateFrame(framesetter, CFRangeMake(0, attributedStr.length), path.cgPath, nil)
        
        let crtContext = UIGraphicsGetCurrentContext()
        crtContext!.textMatrix = CGAffineTransform.identity
        crtContext?.scaleBy(x: 1.0, y: -1.0)
        crtContext?.translateBy(x: 0, y: self.bounds.size.height * -1)
        CTFrameDraw(ctFrame, crtContext!)
        
        let ctLines = CTFrameGetLines(ctFrame) as NSArray
        var originsOfLines = [CGPoint]()
        for _ in 0..<ctLines.count{
            originsOfLines.append(CGPoint.zero)
        }
        let range: CFRange = CFRangeMake(0, 0)
        CTFrameGetLineOrigins(ctFrame, range, &originsOfLines)
        
        for i in 0..<ctLines.count
        {
            let ctLineOrigin = originsOfLines[i]
            let ctRuns = CTLineGetGlyphRuns(ctLines[i] as! CTLine) as NSArray
            
            for ctRun in ctRuns
            {
                let ctAttributes = CTRunGetAttributes(ctRun as! CTRun) as NSDictionary
                let pictureName = ctAttributes.object(forKey: "pictureName")
                if pictureName != nil
                {
                    let offset = CTLineGetOffsetForStringIndex(ctLines[i] as! CTLine, CTRunGetStringRange(ctRun as! CTRun).location, nil)
                    let picturePosX = ctLineOrigin.x + offset
                    
                    let pictureFrame = CGRect(x: picturePosX, y: ctLineOrigin.y, width: picWidth, height: picHeight)
                    let image = UIImage(named: pictureName as! String)
                    crtContext?.draw((image?.cgImage)!, in: pictureFrame)
                }
            }
        }
    }
}

