//
//  CustomizeUITableViewCell.swift
//  CustomizeUITableViewCell
//
//  Created by Jerry on 16/2/21.
//  Copyright © 2016年 www.coolketang.com. All rights reserved.
//

import UIKit

class CustomizeUITableViewCell: UITableViewCell, UITableViewDataSource, UITableViewDelegate {
    
    var tableView : UITableView!;
    var comments : [String] = []
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier);
        
        tableView = UITableView(frame: CGRect(x: 20, y: 0, width: 280, height: 90))
        tableView.dataSource = self
        tableView.delegate = self
        tableView.isScrollEnabled = false;
        
        self.addSubview(tableView)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return comments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)
        -> UITableViewCell {
            let identifier = "reusedCell"
            var cell = tableView.dequeueReusableCell(withIdentifier: identifier)
            
            if(cell == nil){
                cell = UITableViewCell(style: UITableViewCellStyle.default,
                    reuseIdentifier: identifier)
            }
            cell?.textLabel?.text = comments[(indexPath as NSIndexPath).row]
            cell?.textLabel?.font = UIFont.systemFont(ofSize: 12)
            cell?.textLabel?.textColor = UIColor.gray
            cell?.textLabel?.numberOfLines = 0;
            return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath)
        -> CGFloat {
        let subComments = comments[(indexPath as NSIndexPath).row]
        let size = subComments.boundingRect(with: CGSize(),
            options: NSStringDrawingOptions.usesFontLeading, attributes: nil, context: nil);
        let cellHeight =  size.height*size.width/170
        if(cellHeight < 30){
            return 30
        }else{
            return cellHeight
        }
    }
    
    func setCommentsForTable(_ comments:[String]){
        self.comments = comments
        
        var tableHeight:CGFloat = 0
        for i in 0 ..< comments.count
        {
            let size = comments[i].boundingRect(with: CGSize(),
                options: NSStringDrawingOptions.usesFontLeading, attributes: nil, context: nil);
            tableHeight += size.height*size.width/170
        }
        tableView.frame = CGRect(x: 20, y: 0, width: 280, height: tableHeight + 50)
        tableView.reloadData()
    }
    
    func getMyHeight()->CGFloat{
        return tableView.frame.size.height
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(code:)has not brrn implomented");
    }
}
