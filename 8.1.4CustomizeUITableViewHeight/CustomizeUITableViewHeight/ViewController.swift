//
//  ViewController.swift
//  CustomizeUITableViewHeight
//
//  Created by Jerry on 16/2/21.
//  Copyright © 2016年 www.coolketang.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let screenRect = UIScreen.main.bounds
        let tableRect = CGRect(x: 0, y: 20, width: screenRect.size.width, height: screenRect.size.height - 20)
        let tableView = UITableView(frame: tableRect)
        
        tableView.dataSource = self
        tableView.delegate = self
        
        self.view.addSubview(tableView)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if (indexPath as NSIndexPath).row % 2 == 0
        {
            return 104
        }
        return 40
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let identifier = "reusedCell"
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier)
        
        if(cell == nil)
        {
            cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: identifier)
        }
        if (indexPath as NSIndexPath).row % 2 == 0
        {
            cell?.imageView?.image = UIImage(named: "picture.png")
            cell?.textLabel?.text = ""
        }
        else
        {
            cell?.imageView?.image = nil
            cell?.textLabel?.text = "每有会意，便欣然忘食！"
        }
        
        return cell!
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

