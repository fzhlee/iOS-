//
//  ViewController.swift
//  15.2.1MultiTread_ synchronized
//
//  Created by Jerry on 16/7/26.
//  Copyright © 2016年 www.coolketang.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var booksCount = 100
    var soldBooksCount = 0
    var lock : NSLock!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        lock = NSLock()
        
        let salesmanA = Thread(target: self, selector: #selector(ViewController.sellBook), object: nil)
        salesmanA.name = "销售员甲"
        salesmanA.start()
        
        let salesmanB = Thread(target: self, selector: #selector(ViewController.sellBook), object: nil)
        salesmanB.name = "销售员乙"
        salesmanB.start()
        
        let salesmanC = Thread(target: self, selector: #selector(ViewController.sellBook), object: nil)
        salesmanC.name = "销售员丙"
        salesmanC.start()
    }

    func sellBook()
    {
        while true
        {
            lock.lock()
            if booksCount > 0
            {
                Thread.sleep(forTimeInterval: 0.01)
                
                soldBooksCount += 1
                booksCount -= 1
                let threadName = Thread.current.name
                
                print("当前销售员为：\(String(describing: threadName))，此时已售书：\(soldBooksCount)本，还剩余：\(booksCount)本。")
            }
            else
            {
                Thread.exit()
            }
            lock.unlock()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

