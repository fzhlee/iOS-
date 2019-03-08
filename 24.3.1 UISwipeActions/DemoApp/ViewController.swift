//
//  ViewController.swift
//  DemoApp
//
//  Created by CoolKeTang on 17/9/19.
//  Copyright © 2017 www.coolketang.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        let rect = CGRect(x: 0, y: 40, width: 320, height: 420)
        let tableView = UITableView(frame: rect)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        self.view.addSubview(tableView)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let identifier = "reusedCell"
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier)
        
        if(cell == nil){
            cell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: identifier)
        }
        
        cell?.textLabel?.text = "Weekly Report"
        cell?.detailTextLabel?.text = "CoolKeTang Weekly | Welcome here"
        
        return cell!
    }
    
    @available(iOS 11.0, *)
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let unread = UIContextualAction(style: UIContextualAction.Style.normal, title: "Readed") {
            (action, view, completionHandler) in
            print("Readed")
            completionHandler(true)
        }
        unread.backgroundColor = .orange
        
        let remove = UIContextualAction(style: UIContextualAction.Style.destructive, title: "Remove") {
            (action, view, completionHandler) in
            print("Remove")
            completionHandler(true)
        }
        remove.image = UIImage(named: "remove")
        let swipeActionsCOnfiguration = UISwipeActionsConfiguration(actions: [unread, remove])
        return swipeActionsCOnfiguration
    }
    
    @available(iOS 11.0, *)
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let reply = UIContextualAction(style: UIContextualAction.Style.normal, title: "Reply") {
            (action, view, completionHandler) in
            print("Reply")
            completionHandler(true)
        }
        let swipeActionsCOnfiguration = UISwipeActionsConfiguration(actions: [reply])
        return swipeActionsCOnfiguration
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

