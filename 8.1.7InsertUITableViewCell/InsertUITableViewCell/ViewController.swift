//
//  ViewController.swift
//  SelectUITableViewCell
//
//  Created by Jerry on 16/2/22.
//  Copyright © 2016年 www.coolketang.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    var diablo3Level = ["普通模式", "困难模式", "高手模式", "大师模式", "地狱模式"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let screenRect = UIScreen.main.bounds
        let tableRect = CGRect(x: 0, y: 20, width: screenRect.size.width, height: screenRect.size.height - 20)
        let tableView = UITableView(frame: tableRect)
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.setEditing(true, animated: true)
        self.view.addSubview(tableView)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return diablo3Level.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)
        -> UITableViewCell {
            
            let identifier = "reusedCell"
            var cell = tableView.dequeueReusableCell(withIdentifier: identifier)
            
            if(cell == nil){
                cell = UITableViewCell(style: UITableViewCellStyle.default,
                    reuseIdentifier: identifier)
            }
            
            cell?.textLabel?.text = diablo3Level[(indexPath as NSIndexPath).row]
            return cell!
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return UITableViewCellEditingStyle.insert
    }
    
    func tableView(_ tableView: UITableView, commit
        editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete
        {
            diablo3Level.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.right)
        }
        if editingStyle == UITableViewCellEditingStyle.insert{
            diablo3Level.insert("痛苦模式", at:indexPath.row)
            tableView.insertRows(at: [indexPath], with: UITableViewRowAnimation.right)
            
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

