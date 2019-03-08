//
//  WrongItemsViewController.swift
//  DemoApp
//
//  Created by Jerry on 2018/2/2.
//  Copyright © 2018年 www.coolketang.com. All rights reserved.
//

import UIKit
import Toaster

class FailedItemsViewController: BaseViewController {

    var failedItems = Array<Question>()
    var crtSequence = 0
    
    @IBOutlet weak var pageTitle: UILabel!
    @IBOutlet weak var questionTitleLable: QuestionTitleLabel!
    @IBOutlet weak var option1Lable: OptionLabel!
    @IBOutlet weak var option2Lable: OptionLabel!
    @IBOutlet weak var option3Lable: OptionLabel!
    @IBOutlet weak var option4Lable: OptionLabel!
    @IBOutlet weak var splitView: UIView!
    @IBOutlet weak var removeButton: UIImageView!
    @IBOutlet weak var viewAnswerButton: UIImageView!
    @IBOutlet weak var prevQuestionButton: UIImageView!
    @IBOutlet weak var nextQuestionButton: UIImageView!
    @IBOutlet weak var viewAnswerLabel: UILabel!
    @IBOutlet weak var footContainer: UIView!
    @IBOutlet weak var quizBgView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.initData()
        self.initStatus()
        self.updateStatus()
    }
    
    func removeGesture(_ gesture:UITapGestureRecognizer)
    {
        failedItems.remove(at: self.crtSequence-1)
        if self.crtSequence > self.failedItems.count
        {
            self.crtSequence = self.failedItems.count
        }
        updateStatus()
    }
    
    func viewAnswerGesture(_ gesture:UITapGestureRecognizer)
    {
        let question = self.failedItems[self.crtSequence-1]
        if !Data.isIncorrectQuestionOpen(sequence: question.sequence)
        {
            if IAP.shared.oncePurchasedIAP()
            {
                self.showCorrectOptions(question: question)
                
                //更新历史
                Data.openIncorrectQuestion(sequence: question.sequence)
                return
            }
            
            let viewCount = Data.getViewAnswerCount()
            if viewCount <= 0
            {
                self.showAlert()
            }
            else
            {
                self.showCorrectOptions(question: question)
                
                //更新历史
                Data.openIncorrectQuestion(sequence: question.sequence)
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
    
    func showAlert()
    {
        let alert = UIAlertController(title: "温馨提示", message: "为了提高您的学习效果，对key的数量进行了限制。目前已经没有足够的key来解锁答案，您可以通过答题来赢取key，每连续答对两道题目，便可获得一枚key。", preferredStyle: UIAlertControllerStyle.alert)
        
        let yes = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
        alert.addAction(yes)
        self.present(alert, animated: true, completion: nil)
        
    }
    
    func showCorrectOptions(question: Question)
    {
        let right = question.right
        let rightList = right.components(separatedBy: ",")
        for rt in rightList
        {
            let num = Int(rt)!
            switch num
            {
                case 1:
                    self.option1Lable.isActive = true
                case 2:
                    self.option2Lable.isActive = true
                case 3:
                    self.option3Lable.isActive = true
                case 4:
                    self.option4Lable.isActive = true
                default:
                    break
            }
        }
    }
    
    func prevQuestionGesture(_ gesture:UITapGestureRecognizer)
    {
        self.crtSequence -= 1
        if self.crtSequence <= 0
        {
            self.crtSequence = self.failedItems.count
        }
        
        let question = self.failedItems[self.crtSequence-1]
        showQuestion(question: question)
    }
    
    func nextQuestionGesture(_ gesture:UITapGestureRecognizer)
    {
        self.crtSequence += 1
        if self.crtSequence > self.failedItems.count
        {
            self.crtSequence = 1
        }
        
        let question = self.failedItems[self.crtSequence-1]
        showQuestion(question: question)
    }
    
    func initStatus()
    {
        self.quizBgView.layer.cornerRadius = 10
        self.quizBgView.layer.masksToBounds = true
        
        let removeGesture = UITapGestureRecognizer(target: self, action: #selector(removeGesture(_:)))
        let viewAnswerGesture = UITapGestureRecognizer(target: self, action: #selector(viewAnswerGesture(_:)))
        let nextQuestionGesture = UITapGestureRecognizer(target: self, action: #selector(nextQuestionGesture(_:)))
        
        let prevQuestionGesture = UITapGestureRecognizer(target: self, action: #selector(prevQuestionGesture(_:)))
        self.removeButton.addGestureRecognizer(removeGesture)
        self.viewAnswerButton.addGestureRecognizer(viewAnswerGesture)
        self.nextQuestionButton.addGestureRecognizer(nextQuestionGesture)
        self.prevQuestionButton.addGestureRecognizer(prevQuestionGesture)
    }
    
    func updateStatus()
    {
        if self.failedItems.count == 0
        {
            self.option1Lable.isHidden = true
            self.option2Lable.isHidden = true
            self.option3Lable.isHidden = true
            self.option4Lable.isHidden = true
            self.splitView.isHidden = true
            
            self.questionTitleLable.text = "当前还没有回答错误的问题哦~"
            updateTotalTitle()
            self.footContainer.isHidden = true
        }
        else
        {
            let question = self.failedItems[crtSequence-1]
            self.showQuestion(question: question)
            self.footContainer.isHidden = false
        }
        updateViewAnswerLabel()
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
    
    //MARK: -
    //MARK: 显示问题
    func showQuestion(question: Question)
    {
        let questionTitle = question.question
        let questionType = Data.getQuestionTypeName(question: question)
        let answers = question.answers
        let answer1 = answers[0]
        let answer2 = answers[1]
        var answer3 = answers[2]
        var answer4 = answers[3]
        self.questionTitleLable.text = "问：\(questionTitle)[\(questionType)]"
        self.questionTitleLable.questionType = questionType
        self.option1Lable.text = "A、\(answer1)"
        self.option2Lable.text = "B、\(answer2)"
        if answer3 == "0"
        {
            answer3 = ""
            self.option3Lable.text = answer3
        }
        else
        {
            self.option3Lable.text = "C、\(answer3)"
        }
        if answer4 == "0"
        {
            answer4 = ""
            self.option4Lable.text = answer4
        }
        else
        {
            self.option4Lable.text = "D、\(answer4)"
        }
        
        self.deActiveAllOptions()
        
        if Data.isIncorrectQuestionOpen(sequence: question.sequence)
        {
            showCorrectOptions(question: question)
        }
        //更新顶部标题文字
        updateTotalTitle()
    }
    
    func updateTotalTitle()
    {
        self.pageTitle.text = "错题集 [\(self.crtSequence)/\(self.failedItems.count)]"
    }

    //MARK: 取消选择所有答案选项
    func deActiveAllOptions()
    {
        self.option1Lable.isActive = false
        self.option2Lable.isActive = false
        self.option3Lable.isActive = false
        self.option4Lable.isActive = false
    }
    func initData()
    {
        crtSequence = 1
        self.failedItems = Data.getAllFailedQuestions()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //更新答案次数
        self.initData()
        self.updateStatus()
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
