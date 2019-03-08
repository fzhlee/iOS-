//
//  ViewController.swift
//  BasicUITableView
//
//  Created by Jerry on 16/2/20.
//  Copyright © 2016年 www.coolketang.com All rights reserved.
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
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier)
        
        if(cell == nil)
        {
            cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: identifier)
        }
        cell?.textLabel?.text = "命运负责洗牌，玩牌的是我们自己！"
        
        return cell!
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

