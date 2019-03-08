//
//  QuizViewController.swift
//  DemoApp
//
//  Created by LiFazhan on 17/1/20.
//  Copyright © 2017 www.coolketang.com. All rights reserved.
//

import UIKit
import ChameleonFramework

class QuizViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var tableView: UITableView!
    var allSectionData : Array<Array<Question>>!
    
    let kCloseCellHeight: CGFloat = 179
    let kOpenCellHeight: CGFloat = 488
    let kRowsCount = 10
    var cellHeights = [CGFloat]()
    
    var activeCellRow = -1
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        //初始化数据
        self.initData()
        
    }
    
    func initData()
    {
        self.allSectionData = Data.getAllSectionData(section: Data.getTotalSections())
        
        for _ in 0...kRowsCount
        {
            cellHeights.append(kCloseCellHeight)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 10
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath)
    {
        guard case let cell as QuestionCell = cell else {
            return
        }
        
        let row = (indexPath as NSIndexPath).row
        
        if cellHeights[row] == kCloseCellHeight{
            cell.selectedAnimation(false, animated: false, completion:nil)
        }
        else{
            cell.selectedAnimation(true, animated: false, completion: nil)
        }
        
        if activeCellRow > -1
        {
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: { () -> Void in
                cell.quizTopBlackMask.alpha = 0.5
            }, completion: nil)
        }
        else
        {
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: { () -> Void in
                cell.quizTopBlackMask.alpha = 0.0
            }, completion: nil)
        }
        
        
        cell.backgroundColor = UIColor.clear
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FoldingCell", for: indexPath) as! QuestionCell
        cell.crtSectionData = self.allSectionData[indexPath.row]
        
        //设置详细内容
        cell.setCloseBanner(row: indexPath.row)
        let question = cell.crtSectionData[cell.crtQuestionNum-1]
        cell.showQuestion(question: question)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return cellHeights[(indexPath as NSIndexPath).row]
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let cell = tableView.cellForRow(at: indexPath) as! FoldingCell
        
        if cell.isAnimating()
        {
            return
        }
        
        let row = indexPath.row
        if activeCellRow > -1 && activeCellRow != row
        {
            let ip = IndexPath(row: activeCellRow, section: 0)
            let newCell = tableView.cellForRow(at: ip)
            if newCell != nil
            {
                animateCell(tableView:tableView, cell:newCell as! FoldingCell, row: activeCellRow)
            }
        }
        else
        {
            animateCell(tableView:tableView, cell:cell, row: row)
        }
        
    }
    
    func animateCell(tableView:UITableView, cell:FoldingCell, row:Int)
    {
        var duration = 0.0
        if cellHeights[row] == kCloseCellHeight
        {
            //展开
            activeCellRow = row
            cellHeights[row] = kOpenCellHeight
            cell.selectedAnimation(true, animated: true, completion: nil)
            duration = 0.5
            
            //滑动
            let ip = IndexPath(row: activeCellRow, section: 0)
            
            
            self.setMaskBackground()
            
            tableView.scrollToRow(at:ip , at: UITableViewScrollPosition.top, animated: true)
            
            //显示遮罩
            for i in 0..<10
            {
                UIView.animate(withDuration: duration, delay: 0, options: .curveEaseOut, animations: { () -> Void in
                    let ip = IndexPath(row: i, section: 0)
                    let vcell = tableView.cellForRow(at: ip) as? QuestionCell
                    vcell?.quizTopBlackMask.alpha = 0.8
                }, completion: nil)
                
            }
        }
        else
        {
            //收缩
            activeCellRow = -1
            cellHeights[row] = kCloseCellHeight
            cell.selectedAnimation(false, animated: true, completion: nil)
            let cell2 = cell as! QuestionCell
            cell2.updateSumbitCountAndCorrectCount()
            duration = 0.8
            
            self.setNormalBackground()
            
            //显示遮罩
            for i in 0..<10
            {
                UIView.animate(withDuration: duration, delay: 0, options: .curveEaseOut, animations: { () -> Void in
                    let ip = IndexPath(row: i, section: 0)
                    let vcell = tableView.cellForRow(at: ip) as? QuestionCell
                    vcell?.quizTopBlackMask.alpha = 0.0
                }, completion: nil)
                
            }
        }
        
        UIView.animate(withDuration: duration, delay: 0, options: .curveEaseOut, animations: { () -> Void in
            tableView.beginUpdates()
            tableView.endUpdates()
        }, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

