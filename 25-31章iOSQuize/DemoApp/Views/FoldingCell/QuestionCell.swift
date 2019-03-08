//
//  QuestionCell.swift
//  DemoApp
//
//  Created by LiFazhan on 17/1/20.
//  Copyright © 2017 www.coolketang.com. All rights reserved.
//

import UIKit

class QuestionCell: FoldingCell
{
    var crtSectionData = Array<Question>()
    
    var crtQuestionNum = 1
    var endQuestionNum = 10
    
    var continuousCorrect = 0
    var totalCorrect = 0
    var totalIncorrect = 0
    
    var sectionNumber = 0
    var sectionName = ""
    
    @IBOutlet weak var closeNumberLabel: UILabel!
    @IBOutlet weak var openNumberLabel: UILabel!
    @IBOutlet weak var quizCountLabel: UILabel!
    @IBOutlet weak var submitQuestionLabel: UILabel!
    @IBOutlet weak var submitQuestionCorrectRateLabel: UILabel!
    @IBOutlet weak var continuousCorrectLabel: UILabel!
    @IBOutlet weak var questionTitleLable: QuestionTitleLabel!
    @IBOutlet weak var option1Lable: OptionLabel!
    @IBOutlet weak var option2Lable: OptionLabel!
    @IBOutlet weak var option3Lable: OptionLabel!
    @IBOutlet weak var option4Lable: OptionLabel!
    @IBOutlet weak var quizBgView: UIView!
    @IBOutlet weak var quizTopBlackMask: UIView!
    @IBOutlet weak var submitButton: SubmitAnswerButton!
    @IBOutlet weak var correntNumberLabel: UILabel!
    @IBOutlet weak var incorrectNumberLabel: UILabel!
    @IBOutlet weak var questionArea: UIView!
    @IBOutlet weak var progressCircleView: ProgressCircleView!
    @IBOutlet weak var rateIcon: UIImageView!
    
    override func awakeFromNib()
    {
        foregroundView.layer.cornerRadius = 10
        foregroundView.layer.masksToBounds = true
        
        submitButton.layer.cornerRadius = 5
        submitButton.layer.masksToBounds = true

        let bgViewTap = UITapGestureRecognizer(target: self, action: #selector(bgViewTap(_:)))
        let bquestionAreaTap = UITapGestureRecognizer(target: self, action: #selector(bgViewTap(_:)))
        self.quizBgView.addGestureRecognizer(bgViewTap)
        self.questionArea.addGestureRecognizer(bquestionAreaTap)

        let optionTap1 = UITapGestureRecognizer(target: self, action: #selector(optionTap(_:)))
        let optionTap2 = UITapGestureRecognizer(target: self, action: #selector(optionTap(_:)))
        let optionTap3 = UITapGestureRecognizer(target: self, action: #selector(optionTap(_:)))
        let optionTap4 = UITapGestureRecognizer(target: self, action: #selector(optionTap(_:)))
        self.option1Lable.addGestureRecognizer(optionTap1)
        self.option2Lable.addGestureRecognizer(optionTap2)
        self.option3Lable.addGestureRecognizer(optionTap3)
        self.option4Lable.addGestureRecognizer(optionTap4)
        
        //Key的数量
        let viewAnswerCount = Data.getViewAnswerCount()
        self.continuousCorrectLabel.text = "\(viewAnswerCount)"
        
        super.awakeFromNib()
    }

    @objc func bgViewTap(_ gesture:UITapGestureRecognizer)
    {
        return
    }
    
    //MARK: 响应答案选项的点击事件
    @objc func optionTap(_ gesture:UITapGestureRecognizer)
    {
        let label = gesture.view as! OptionLabel
        if !label.isActive
        {
            if self.questionTitleLable.questionType == .单选题 || self.questionTitleLable.questionType == .判断题
            {
                self.deActiveAllOptions()
            }
            
            label.isActive = true
        }
        else
        {
            label.isActive = false
        }
        updateSubmitButtonStatus()
    }
    
    //MARK: 更新提交按钮的显示状态
    func updateSubmitButtonStatus()
    {
        var canSubmit = false
        if self.questionTitleLable.questionType == .单选题 || self.questionTitleLable.questionType == .判断题
        {
            if self.option1Lable.isActive || self.option2Lable.isActive || self.option3Lable.isActive || self.option4Lable.isActive
            {
                canSubmit = true
            }
        }
        else
        {
            var activeCount = 0
            if self.option1Lable.isActive
            {
                activeCount += 1
            }
            if self.option2Lable.isActive
            {
                activeCount += 1
            }
            if self.option3Lable.isActive
            {
                activeCount += 1
            }
            if self.option4Lable.isActive
            {
                activeCount += 1
            }
            if activeCount > 1
            {
                canSubmit = true
            }
        }
        
        self.submitButton.canSubmit = canSubmit
    }
    
    //MARK: 取消选择所有答案选项
    func deActiveAllOptions()
    {
        self.option1Lable.isActive = false
        self.option2Lable.isActive = false
        self.option3Lable.isActive = false
        self.option4Lable.isActive = false
        self.submitButton.canSubmit = false
    }
    
    override func animationDuration(_ itemIndex:NSInteger, type:AnimationType)-> TimeInterval
    {
        let durations = [0.26, 0.2, 0.2]
        return durations[itemIndex]
    }
    
    //MARK: -
    //MARK: 初始设置
    func setCloseBanner(row: Int)
    {
        //设置section
        let sections = Data.getTotalSections()
        self.sectionNumber = row
        self.sectionName = sections[row]
        
        //设置关闭时列表中的答题次数和正确率
        let count = crtSectionData.count
        self.updateSumbitCountAndCorrectCount()
        
        //设置展开时的内容
        self.closeNumberLabel.text = "\(row+1).\(self.sectionName)篇"
        updateOpenNumberLabelText()
        self.quizCountLabel.text = "\(count)题"
        
        //设置本次测试的题目范围
        self.crtQuestionNum = Data.getStoredQuestionNumber(section: self.sectionNumber)
        self.endQuestionNum = Data.getStoredEndQuestionNumber(section: self.sectionNumber)
        if self.endQuestionNum == 1
        {
            self.endQuestionNum = self.crtQuestionNum + 9
        }
        if self.endQuestionNum > crtSectionData.count
        {
            self.endQuestionNum = crtSectionData.count
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
        
        //更新顶部标题文字
        updateOpenNumberLabelText()
        
        //加载广告
        AdMob.shared.loadInterstitial()
        
        //正确数量和错误数量
        self.totalCorrect = Data.getStoredCorrectNumber(section: self.sectionNumber)
        self.totalIncorrect = Data.getStoredIncorrectNumber(section: self.sectionNumber)
        
        self.incorrectNumberLabel.text = "错误：\(self.totalIncorrect)"
        self.correntNumberLabel.text = "正确：\(self.totalCorrect)"
        
    }
    
    //MARK: 当显示新的题目时更新顶部的标题
    func updateOpenNumberLabelText()
    {
        self.openNumberLabel.text = "\(sectionNumber+1).\(self.sectionName)篇[\(self.crtQuestionNum)/\(self.endQuestionNum)]"
    }
    //MARK: -
    //MARK: 以动画的形式更新正确数字
    func updateCorrectNumber(count: Int)
    {
        self.incorrectNumberLabel.alpha = 1.0
        self.incorrectNumberLabel.text = "错误：\(self.totalIncorrect)"
        
        self.correntNumberLabel.text = "正确：\(self.totalCorrect)"
        UIView.animate(withDuration: 0.5, delay: 0, options: [.curveEaseOut], animations: { () -> Void in
            self.correntNumberLabel.alpha = 0.0
        }, completion: { (Bool) -> Void in
            UIView.animate(withDuration: 0.5, delay: 0.0, options: [.curveEaseOut], animations: { () -> Void in
                self.correntNumberLabel.alpha = 1.0
            }, completion: nil)
        })
    }
    //MARK: 以动画的形式更新正确数字
    func updateInCorrectNumber(count: Int)
    {
        self.correntNumberLabel.alpha = 1.0
        self.correntNumberLabel.text = "正确：\(self.totalCorrect)"
        
        self.incorrectNumberLabel.text = "错误：\(self.totalIncorrect)"
        UIView.animate(withDuration: 0.5, delay: 0.0, options: [.curveLinear], animations: { () -> Void in
            self.incorrectNumberLabel.alpha = 0.0
        }, completion: nil)
        UIView.animate(withDuration: 0.5, delay: 0.6, options: [.curveLinear], animations: { () -> Void in
            self.incorrectNumberLabel.alpha = 1.0
        }, completion: nil)
    }
    
    //MARK: 更新close面板的数字
    func updateSumbitCountAndCorrectCount()
    {
        let submitQuestionCount = Data.getSubmitQuestionCount(section: self.sectionNumber)
        let submitQuestionCorrectCount = Data.getSubmitQuestionCorrectCount(section: self.sectionNumber)
        var rate = 0
        if submitQuestionCount != 0
        {
            rate = submitQuestionCorrectCount*100/submitQuestionCount
        }
        
        if submitQuestionCount == 0
        {
            self.submitQuestionLabel.text = "0"
            self.submitQuestionCorrectRateLabel.text = "0%"
        }
        else
        {
            self.submitQuestionLabel.text = "\(submitQuestionCount)"
            self.submitQuestionCorrectRateLabel.text = "\(rate)%"
        }
        
        if rate >= 90
        {
            self.rateIcon.image = UIImage(named: "stars5")
        }
        else if rate >= 80
        {
            self.rateIcon.image = UIImage(named: "stars4")
        }
        else if rate >= 60
        {
            self.rateIcon.image = UIImage(named: "stars3")
        }
        else if rate >= 40
        {
            self.rateIcon.image = UIImage(named: "stars2")
        }
        else if rate >= 10
        {
            self.rateIcon.image = UIImage(named: "stars1")
        }
        else
        {
            self.rateIcon.image = UIImage(named: "stars0")
        }
    }
}

extension QuestionCell
{
  @IBAction func buttonHandler(_ sender: AnyObject)
  {
        if !self.submitButton.canSubmit
        {
            //无法提交
            if self.questionTitleLable.questionType == .多选题
            {
                self.correntNumberLabel.text = "请选择多个答案之后再提交。"
            }
            else
            {
                self.correntNumberLabel.text = "请选择一个答案之后再提交。"
            }
            self.incorrectNumberLabel.alpha = 0.0
            
            UIView.animate(withDuration: 0.5, delay: 0, options: [.curveEaseOut], animations: { () -> Void in
                self.correntNumberLabel.alpha = 0.0
            }, completion: { (Bool) -> Void in
                UIView.animate(withDuration: 0.5, delay: 0.0, options: [.curveEaseOut], animations: { () -> Void in
                    self.correntNumberLabel.alpha = 1.0
                }, completion: nil)
            })
            return
        }
        if self.progressCircleView.isHidden == false
        {
            //正在显示结果
            self.endQuestionNum = self.crtQuestionNum + 9
            if self.endQuestionNum > crtSectionData.count
            {
                self.endQuestionNum = crtSectionData.count
            }
            //显示下题内容
            let question = self.crtSectionData[self.crtQuestionNum-1]
            self.showQuestion(question: question)
            
            //重置状态数字
            self.totalIncorrect = 0
            self.totalCorrect = 0
            self.continuousCorrect = 0
            self.correntNumberLabel.text = "正确：0"
            self.incorrectNumberLabel.text = "错误：0"
            
            //取消所有选项
            self.deActiveAllOptions()
            
            //隐藏图表
            self.progressCircleView.isHidden = true
            self.questionArea.isHidden = false
            self.submitButton.setTitle("下一题", for: .normal)
            
            return
        }
    
        //正确进入下一题
        let question = self.crtSectionData[self.crtQuestionNum-1]
        let correctAnswer = question.right
        let correctAnswers = correctAnswer.components(separatedBy: ",")
        var isCorrent = true
        //检查提交的答案是否有误
        for answer in correctAnswers
        {
            let answerInt = Int(answer)
            let optionLabel = self.containerView.viewWithTag(answerInt!) as! OptionLabel
            if !optionLabel.isActive
            {
                isCorrent = false
            }
        }
        if isCorrent
        {
            //正确
            self.totalCorrect += 1
            self.continuousCorrect += 1
            if self.continuousCorrect == 2
            {
                //每连续答对两道题目，奖励一枚key
                self.continuousCorrect = 0
                Data.updateAnswerCount(num: 1)
                
                //更新key数量
                let viewAnswerCount = Data.getViewAnswerCount()
                self.continuousCorrectLabel.text = "\(viewAnswerCount)"
                
                UIView.animate(withDuration: 0.5, delay: 0, options: [.curveEaseOut], animations: { () -> Void in
                    self.continuousCorrectLabel.alpha = 0.0
                }, completion: { (Bool) -> Void in
                    UIView.animate(withDuration: 0.5, delay: 0.0, options: [.curveEaseOut], animations: { () -> Void in
                        self.continuousCorrectLabel.alpha = 1.0
                    }, completion: nil)
                })
            }
            self.updateCorrectNumber(count: self.totalCorrect)
            Data.setStoredCorrectNumber(section: self.sectionNumber, count: self.totalCorrect)
            Data.appendSubmitQuestionCorrectCount(section: self.sectionNumber)
        }
        else
        {
            //错误
            self.totalIncorrect += 1
            self.continuousCorrect = 0
            self.updateInCorrectNumber(count: self.totalIncorrect)
            
            Data.setStoredIncorrectNumber(section: self.sectionNumber, count: self.totalIncorrect)
            Data.setIncorrectQuestion(question: question)
        }
        Data.appendSubmitQuestionCount(section: self.sectionNumber)
    
        self.crtQuestionNum += 1
        if self.crtQuestionNum > endQuestionNum
        {
            //结束测验
            self.progressCircleView.updateSubView()
            
            if self.crtQuestionNum > self.crtSectionData.count
            {
                self.crtQuestionNum = 1
            }
            //提交成绩，显示结果
            let score = Int(self.totalCorrect*100/(self.totalCorrect+self.totalIncorrect))
            self.questionArea.isHidden = true
            self.submitButton.setTitle("下一组题目", for: .normal)
            
            self.progressCircleView.isHidden = false
            self.progressCircleView.alpha = 0
            self.progressCircleView.setScore(score: score)
            
            Data.setStoredCorrectNumber(section: self.sectionNumber, count: 0)
            Data.setStoredIncorrectNumber(section: self.sectionNumber, count: 0)
            
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseIn, animations: { () -> Void in
                self.progressCircleView.alpha = 1.0
            }, completion: { (Bool) -> Void in
                self.progressCircleView.setProgress(value: CGFloat(score), animationDuration: 1.0)
                {
                    
                }
            })
            
            Data.setStoredQuestionNumber(section: self.sectionNumber, seq: self.crtQuestionNum)
            self.endQuestionNum = self.crtQuestionNum + 9
            if self.endQuestionNum > crtSectionData.count
            {
                self.endQuestionNum = crtSectionData.count
            }
            Data.setStoredEndQuestionNumber(section: self.sectionNumber, seq: self.endQuestionNum)
            
            //显示广告
            AdMob.shared.showInterstitial()
        }
        else
        {
            //显示下一题
            let nextQuestion = self.crtSectionData[self.crtQuestionNum-1]
            self.showQuestion(question: nextQuestion)
            self.deActiveAllOptions()
            
            Data.setStoredQuestionNumber(section: self.sectionNumber, seq: self.crtQuestionNum)
            Data.setStoredEndQuestionNumber(section: self.sectionNumber, seq: self.endQuestionNum)
        }
    
  }
    
    
    
    
}
