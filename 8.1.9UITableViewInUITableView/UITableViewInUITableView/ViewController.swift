//
//  ViewController.swift
//  UITableViewInUITableView
//
//  Created by Jerry on 16/2/23.
//  Copyright © 2016年 www.coolketang.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var articles = ["微软有哪些「黑历史」？", "苹果有哪些黑科技？", "巴宝莉和 Apple TV 强强联手推出天台秀直播"]
    var comments = [["1.Nebraska这个梗是这样的，当年美国很多公司的呼叫中心设在nebraska（原因有两说，一说是战略空军司令部在这，所以电话线路多，一说是中西部的人说话口音比较标准. 我没考证过哪个对，或者是两个都有），那时候AT&T 店大欺客，800只能打长途不能打市话. 所以八十年代各种广告后面附的电话都是除Nebraska以外，然后后面应该还有一个Nebraska专用的号码.","2.鲍尔默一直都是这种画风……","3.见多了我们的cheer leader的表演就不见怪了。内部company meeting上的那些你们没见过，还有billg出演的。还有个嘲讽非windows系统的广告，好像是和Brian Valentine一起演的，那货也是个怪咖，以前Windows的SVP。"],["1.它真的黑，黑出亮。","2.在天朝，购买它所缴纳的消费税可以买一台超级本","3.这家能够操作供应链的公司，想要什么样的显卡、什么样的内存、什么样的SSD都能信手拈来；这够黑吧"],["1.据巴宝莉新闻稿了解，Apple TV 在直播过程中将推出购物功能，观众能直接预定秀场上出现的服装。这么看来，这个功能用在国内简直是一大引入点，可以在春晚直播的过程中购买明星同款。","2.这次怎么不用iPhone®拍摄b？"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let screenRect = UIScreen.main.bounds
        let tableRect = CGRect(x: 0, y: 20, width: screenRect.size.width, height: screenRect.size.height - 20)
        let tableView = UITableView(frame: tableRect)
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = UITableViewCellSeparatorStyle.none;
        
        self.view.addSubview(tableView)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return articles.count * 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)
        -> UITableViewCell {
            
            let cellForArticle = "cellForArticle"
            let cellForComments = "cellForComments"
            
            var cell1:UITableViewCell?;
            var cell2:CustomizeUITableViewCell?;
            
            if (indexPath as NSIndexPath).row % 2 == 0{
                cell1 = tableView.dequeueReusableCell(withIdentifier: cellForArticle)
                if cell1 == nil{
                    cell1 = UITableViewCell(style: UITableViewCellStyle.default,
                        reuseIdentifier: cellForArticle)
                }
                cell1?.textLabel?.text = articles[(indexPath as NSIndexPath).row/2]
                cell1?.textLabel?.font = UIFont.systemFont(ofSize: 16)
                cell1?.textLabel?.textColor = UIColor.lightGray
                cell1?.backgroundColor = UIColor.black
                return cell1!
            }else{
                cell2 = tableView.dequeueReusableCell(withIdentifier: cellForComments) as? CustomizeUITableViewCell
                if cell2 == nil{
                    cell2 = CustomizeUITableViewCell(style: UITableViewCellStyle.default,
                        reuseIdentifier: cellForComments)
                }
                let subComments = comments[(indexPath as NSIndexPath).row/2]
                cell2?.setCommentsForTable(subComments)
                return cell2!
            }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if (indexPath as NSIndexPath).row % 2 == 0{
            return 40
        }else{
            let subComments = comments[(indexPath as NSIndexPath).row/2]
            var cellHeight:CGFloat = 0
            for i in 0 ..< subComments.count
            {
                let size = subComments[i].boundingRect(with: CGSize(), options: NSStringDrawingOptions.usesFontLeading, attributes: nil, context: nil);
                cellHeight += size.height*(size.width/170)
            }
            return cellHeight + 50
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

