//
//  ViewController.swift
//  CustomizeUITableViewCell
//
//  Created by Jerry on 16/2/21.
//  Copyright © 2016年 www.coolketang.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let screenRect = UIScreen.main.bounds
        let tableRect = CGRect(x: 0, y: 20, width: screenRect.size.width, height: screenRect.size.height - 20)
        let tableView = UITableView(frame: tableRect)
        
        tableView.dataSource = self
        
        self.view.addSubview(tableView)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let identifier = "reusedCell"
        var cell:CustomizeUITableViewCell? = tableView.dequeueReusableCell(withIdentifier: identifier) as? CustomizeUITableViewCell
        
        if(cell == nil)
        {
            cell = CustomizeUITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: identifier)
        }
        
        cell?.title?.text = "客户姓名"
        
        return cell!
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

