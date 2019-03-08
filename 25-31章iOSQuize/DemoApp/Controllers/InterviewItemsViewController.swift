//
//  InterviewItemsViewController.swift
//  DemoApp
//
//  Created by Jerry on 2018/2/2.
//  Copyright © 2018年 www.coolketang.com. All rights reserved.
//

import UIKit
import Toaster

class InterviewItemsViewController: BaseViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    var crtSequence: Int = 0
    var allInterviews : Array<Interview>!
    
    @IBOutlet weak var pageTitle: UILabel!
    @IBOutlet weak var questionTitleLable: UILabel!
    @IBOutlet weak var answerTextView: UITextView!
    
    @IBOutlet weak var quizBgView: UIView!
    @IBOutlet weak var questionPicker : UIPickerView!
    @IBOutlet weak var pickerContainer: UIView!
    
    @IBOutlet weak var viewAnswerButton: UIImageView!
    @IBOutlet weak var prevQuestionButton: UIImageView!
    @IBOutlet weak var nextQuestionButton: UIImageView!
    @IBOutlet weak var viewAnswerLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.quizBgView.layer.cornerRadius = 10
        self.quizBgView.layer.masksToBounds = true

        self.pickerContainer.layer.cornerRadius = 10
        self.pickerContainer.layer.masksToBounds = true
        
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(InterviewItemsViewController.hidePickerView)))
        
        let viewAnswerGesture = UITapGestureRecognizer(target: self, action: #selector(viewAnswerGesture(_:)))
        let nextQuestionGesture = UITapGestureRecognizer(target: self, action: #selector(nextInterviewGesture(_:)))
        let prevQuestionGesture = UITapGestureRecognizer(target: self, action: #selector(prevInterviewGesture(_:)))
        
        self.viewAnswerButton.addGestureRecognizer(viewAnswerGesture)
        self.nextQuestionButton.addGestureRecognizer(nextQuestionGesture)
        self.prevQuestionButton.addGestureRecognizer(prevQuestionGesture)
        
        //
        self.initData()
        self.crtSequence = Data.getCurrentInterview()
        self.showInterview(interview: self.allInterviews[self.crtSequence-1])
        
        self.questionPicker.selectRow(self.crtSequence-1, inComponent: 0, animated: true)
    }

    func initData()
    {
        allInterviews = Data.getAllInterviews()
    }
    
    //MARK: -
    //MARK: 显示问题
    func showInterview(interview:Interview)
    {
        self.questionTitleLable.text = "问题：\(interview.question)"
        
        if Data.isInterviewOpen(sequence: interview.sequence)
        {
            self.showAnswer(answer: interview.answer)
        }
        else
        {
            self.showAnswer(answer: "")
        }
        
        Data.setCurrentInterview(sequence: interview.sequence)
        self.updateTopTitle()
    }
    
    @IBAction func showQuestionList(_ sender: AnyObject)
    {
        showOrHidePickerView()
    }
    
    func showOrHidePickerView()
    {
        if self.pickerContainer.isHidden
        {
            self.pickerContainer.isHidden = false
            
            UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut, animations: { () -> Void in
                self.pickerContainer.alpha = 1.0
            }, completion: nil)
        }
        else
        {
            hidePickerView()
        }
    }
    
    func hidePickerView()
    {
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut, animations: { () -> Void in
            self.pickerContainer.alpha = 0.0
        }, completion: { (Bool) -> Void in
            self.pickerContainer.isHidden = true
        })
    }
    
    func prevInterviewGesture(_ gesture:UITapGestureRecognizer)
    {
        self.crtSequence -= 1
        if self.crtSequence <= 0
        {
            self.crtSequence = self.allInterviews.count
        }
        
        let interview = self.allInterviews[self.crtSequence-1]
        showInterview(interview: interview)
    }
    
    func nextInterviewGesture(_ gesture:UITapGestureRecognizer)
    {
        self.crtSequence += 1
        if self.crtSequence > self.allInterviews.count
        {
            self.crtSequence = 1
        }
        
        let interview = self.allInterviews[self.crtSequence-1]
        showInterview(interview: interview)
    }
    
    //MARK: -
    //MARK: 显示答案
    func viewAnswerGesture(_ gesture:UITapGestureRecognizer)
    {
        let interview = self.allInterviews[self.crtSequence-1]
        if !Data.isInterviewOpen(sequence: interview.sequence)
        {
            if IAP.shared.oncePurchasedIAP()
            {
                self.showAnswer(answer: interview.answer)
                
                //更新历史
                Data.openMianShiTi(sequence: interview.sequence)
                return
            }
            let viewCount = Data.getViewAnswerCount()
            if viewCount <= 0
            {
                self.showAlert()
            }
            else
            {
                self.showAnswer(answer: interview.answer)
                
                //更新历史
                Data.openMianShiTi(sequence: interview.sequence)
                Data.updateAnswerCount(num: -1)
                updateViewAnswerLabel()
            }
        }
        else
        {
            ToastView.appearance().bottomOffsetPortrait = 200
            Toast(text: "当前问题已经显示了答案。").show()
        }
    }
    
    func showAnswer(answer: String)
    {
        if answer == ""
        {
            self.answerTextView.text = ""
        }
        else
        {
            self.answerTextView.text = "参考答案："+answer
        }
    }
    
    func showAlert()
    {
        let alert = UIAlertController(title: "温馨提示", message: "为了提高您的学习效果，对key的数量进行了限制。目前已经没有足够的key来解锁答案，您可以通过答题来赢取key，每连续答对两道题目，便可获得一枚key。", preferredStyle: UIAlertControllerStyle.alert)
        
        let yes = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
        alert.addAction(yes)
        self.present(alert, animated: true, completion: nil)
        
    }
    
    func updateTopTitle()
    {
        self.pageTitle.text = "面试题 [\(self.crtSequence)/\(self.allInterviews.count)]"
    }

    func updateViewAnswerLabel()
    {
        if IAP.shared.oncePurchasedIAP()
        {
            self.viewAnswerLabel.text = "显示答案"
        }
        else
        {
            let viewCount = Data.getViewAnswerCount()
            self.viewAnswerLabel.text = "显示答案[\(viewCount)]"
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let color = [NSForegroundColorAttributeName: UIColor.white]
        let attritedSTring = NSAttributedString(string: "第\(row+1)题", attributes: color)
        
        return attritedSTring
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return allInterviews.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.crtSequence = row + 1
        self.showInterview(interview: self.allInterviews[self.crtSequence-1])
    }
    
    @IBAction func shareItem(_ sender: Any) {
        let shareParames = NSMutableDictionary()
        shareParames.ssdkSetupShareParams(byText: "\(self.questionTitleLable.text)",
                                          images : UIImage(named: "shareApp.png"),
                                          url : NSURL(string:"https://itunes.apple.com/cn/app/id1209739676") as URL!,
                                          title : "iOS开发一千题",
                                          type : SSDKContentType.auto)
        
        SSUIShareActionSheetStyle.setShareActionSheetStyle(.simple)
        ShareSDK.showShareActionSheet(nil, items: nil, shareParams: shareParames, onShareStateChanged: nil)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //更新答案次数
        self.updateViewAnswerLabel()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
