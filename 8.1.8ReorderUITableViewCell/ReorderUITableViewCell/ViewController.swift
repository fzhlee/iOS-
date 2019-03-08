//
//  ViewController.swift
//  SelectUITableViewCell
//
//  Created by Jerry on 16/2/22.
//  Copyright © 2016年 www.coolketang.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    var customers = ["[普通客户]冮炳林", "[普通客户]扶伽霖", "[普通客户]冈皑冰",
        "[金牌客户]符博富", "[普通客户]范姜臣华"]
    
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
        return customers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)
        -> UITableViewCell {
            
            let identifier = "reusedCell"
            var cell = tableView.dequeueReusableCell(withIdentifier: identifier)
            
            if(cell == nil){
                cell = UITableViewCell(style: UITableViewCellStyle.default,
                    reuseIdentifier: identifier)
            }
            
            cell?.textLabel?.text = customers[(indexPath as NSIndexPath).row]
            return cell!
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return UITableViewCellEditingStyle.none
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let fromRow = (sourceIndexPath as NSIndexPath).row
        let toRow = (destinationIndexPath as NSIndexPath).row
        let customer = customers[fromRow]
        
        customers.remove(at: fromRow)
        customers.insert(customer, at: toRow)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

