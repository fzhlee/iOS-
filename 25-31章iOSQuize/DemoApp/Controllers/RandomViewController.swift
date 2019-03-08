//
//  RandomViewController.swift
//  DemoApp
//
//  Created by Jerry on 2018/1/31.
//  Copyright © 2018年 www.coolketang.com. All rights reserved.
//

import UIKit

class RandomViewController: BaseViewController {

    var crtSectionData = Array<Question>()
    
    var crtQuestionNum = 1
    var endQuestionNum = 10
    
    var continuousCorrect = 0
    var totalCorrect = 0
    var totalIncorrect = 0
    
    @IBOutlet weak var pageTitle: UILabel!
    @IBOutlet weak var questionTitleLable: QuestionTitleLabel!
    @IBOutlet weak var option1Lable: OptionLabel!
    @IBOutlet weak var option2Lable: OptionLabel!
    @IBOutlet weak var option3Lable: OptionLabel!
    @IBOutlet weak var option4Lable: OptionLabel!
    @IBOutlet weak var quizBgView: UIView!
    @IBOutlet weak var submitButton: SubmitAnswerButton!
    @IBOutlet weak var correntNumberLabel: UILabel!
    @IBOutlet weak var incorrectNumberLabel: UILabel!
    @IBOutlet weak var questionArea: UIView!
    @IBOutlet weak var continuousCorrectLabel: UILabel!
    @IBOutlet weak var progressCircleView: ProgressCircleView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.quizBgView.layer.cornerRadius = 10
        self.quizBgView.layer.masksToBounds = true

        self.submitButton.layer.cornerRadius = 5
        self.submitButton.layer.masksToBounds = true
        
        //初始化数据
        self.initData()
        
        self.showQuestion(question: self.crtSectionData[0])        
        
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
        
        //加载广告
        AdMob.shared.loadInterstitial()
    }
    
    func initData()
    {
        self.crtSectionData = Data.getRandomQuiz()
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
        
    }
    
    //MARK: 当显示新的题目时更新顶部的标题
    func updateOpenNumberLabelText()
    {
        self.pageTitle.text = "随机题 [\(self.crtQuestionNum)/\(self.endQuestionNum)]"
    }
    
    //MARK: -
    //MARK: 以动画的形式更新正确数字
    func updateCorrectNumber(count: Int)
    {
        self.incorrectNumberLabel.alpha = 1.0
        self.incorrectNumberLabel.text = "错误：\(self.totalIncorrect)"
        
        self.correntNumberLabel.text = "正确：\(count)"
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
        
        self.incorrectNumberLabel.text = "错误：\(count)"
        UIView.animate(withDuration: 0.5, delay: 0.0, options: [.curveLinear], animations: { () -> Void in
            self.incorrectNumberLabel.alpha = 0.0
        }, completion: nil)
        UIView.animate(withDuration: 0.5, delay: 0.6, options: [.curveLinear], animations: { () -> Void in
            self.incorrectNumberLabel.alpha = 1.0
        }, completion: nil)
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
    
    @IBAction func buttonHandler(_ sender: AnyObject)
    {
        //判断是否选择足够数目的答案
        if !self.submitButton.canSubmit
        {
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
        //是否正在显示结果
        if self.progressCircleView.isHidden == false
        {
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
        
        //正在进入下一题
        let question = self.crtSectionData[self.crtQuestionNum-1]
        let correctAnswer = question.right
        let correctAnswers = correctAnswer.components(separatedBy: ",")
        var isCorrent = true
        //检查提交的答案是否有误
        for answer in correctAnswers
        {
            let answerInt = Int(answer)
            let optionLabel = self.questionArea.viewWithTag(answerInt!) as! OptionLabel
            if !optionLabel.isActive
            {
                isCorrent = false
            }
        }
        if isCorrent
        {
            //正确
            self.totalCorrect += 1
            self.updateCorrectNumber(count: self.totalCorrect)
            
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
        }
        else
        {
            //错误
            self.totalIncorrect += 1
            self.continuousCorrect = 0
            self.updateInCorrectNumber(count: self.totalIncorrect)
            Data.setIncorrectQuestion(question: question)
        }
        
        self.crtQuestionNum += 1
        if self.crtQuestionNum > endQuestionNum
        {
            self.progressCircleView.updateSubView()
            
            if self.crtQuestionNum > self.crtSectionData.count
            {
                self.crtQuestionNum = 1
            }
            //提交成绩，显示结果
            let score = Int(self.totalCorrect*100/(self.totalCorrect+self.totalIncorrect))
            self.questionArea.isHidden = true
            self.submitButton.setTitle("下一组随机试题", for: .normal)
            
            self.progressCircleView.isHidden = false
            self.progressCircleView.alpha = 0
            self.progressCircleView.setScore(score: score)
            
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseIn, animations: { () -> Void in
                self.progressCircleView.alpha = 1.0
            }, completion: { (Bool) -> Void in
                self.progressCircleView.setProgress(value: CGFloat(score), animationDuration: 1.0)
                {
                    
                }
            })
            
            //显示广告
            AdMob.shared.showInterstitial()
        }
        else
        {
            //显示下一题
            let nextQuestion = self.crtSectionData[self.crtQuestionNum-1]
            self.showQuestion(question: nextQuestion)
            self.deActiveAllOptions()
            
        }
        
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
