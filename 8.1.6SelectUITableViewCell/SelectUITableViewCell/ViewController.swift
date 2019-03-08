//
//  ViewController.swift
//  SelectUITableViewCell
//
//  Created by Jerry on 16/2/22.
//  Copyright © 2016年 www.coolketang.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    let diablo3Level = ["普通模式", "困难模式", "高手模式", "大师模式", "痛苦模式"]
    
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

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return diablo3Level.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)
        -> UITableViewCell {
            
            let identifier = "reusedCell"
            var cell = tableView.dequeueReusableCell(withIdentifier: identifier)
            
            if(cell == nil)
            {
                cell = UITableViewCell(style: UITableViewCellStyle.default,
                    reuseIdentifier: identifier)
            }
            
            cell?.textLabel?.text = diablo3Level[(indexPath as NSIndexPath).row]
            
            return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        if(cell?.accessoryType == UITableViewCellAccessoryType.none){
            cell?.accessoryType = UITableViewCellAccessoryType.checkmark
            print("您选择了：\(cell?.textLabel?.text)")
        }else{
            cell?.accessoryType = UITableViewCellAccessoryType.none
            print("您取消选择了：\(cell?.textLabel?.text)")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

