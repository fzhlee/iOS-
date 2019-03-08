//
//  PageControlViewController.swift
//  UIViewOntrollerProject_ScrollView
//
//  Created by Jerry on 16/5/30.
//  Copyright © 2016年 www.coolketang.com. All rights reserved.
//

import UIKit

class PageControlViewController: UIViewController, UIScrollViewDelegate {
    
    var scrollView = UIScrollView()
    var pageControl = UIPageControl()
    var isPageControlUsed = false
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        var screenFrame = UIScreen.main.bounds
        let screenWidth = screenFrame.size.width
        let screenHeight = screenFrame.size.height
        
        scrollView.frame = screenFrame
        scrollView.isPagingEnabled = true
        scrollView.contentSize = CGSize(width: screenWidth * 2, height: screenHeight)
        scrollView.backgroundColor = UIColor.black
        scrollView.delegate = self
        
        let pcHeight:CGFloat = 50.0
        let pcRect = CGRect(x: 0, y: screenHeight - pcHeight, width: screenWidth, height: pcHeight)
        
        pageControl.frame = pcRect
        pageControl.numberOfPages = 2
        pageControl.currentPage = 0
        pageControl.backgroundColor = UIColor.gray
        pageControl.addTarget(self, action: #selector(PageControlViewController.pageControlDidChanged(_:)), for: UIControlEvents.valueChanged)
        
        let firstController = FirstViewController()
        screenFrame.origin.x = 0
        firstController.view.frame = screenFrame
        
        let secondController = SecondViewController()
        screenFrame.origin.x = screenFrame.size.width
        secondController.view.frame = screenFrame
        
        scrollView.addSubview(firstController.view)
        scrollView.addSubview(secondController.view)
        
        self.view.addSubview(scrollView)
        self.view.addSubview(pageControl)
    }
    
    @objc func pageControlDidChanged(_ sender:AnyObject)
    {
        let crtPage = (CGFloat)(pageControl.currentPage)
        var frame = scrollView.frame
        frame.origin.x = frame.size.width * crtPage
        frame.origin.y = 0
        
        scrollView.scrollRectToVisible(frame, animated: true)
        isPageControlUsed =  true
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView)
    {
        if(!isPageControlUsed)
        {
            let pageWidth = scrollView.frame.size.width
            let page = floor((scrollView.contentOffset.x - pageWidth/2)/pageWidth) + 1
            pageControl.currentPage = Int(page)
        }
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        isPageControlUsed = false
    }
}
