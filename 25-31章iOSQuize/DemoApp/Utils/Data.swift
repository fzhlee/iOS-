//
//  Data.swift
//  DemoApp
//
//  Created by Jerry on 2018/1/28.
//  Copyright © 2018 www.coolketang.com. All rights reserved.
//

import Foundation

class Data
{
    class func getTotalSections() -> Array<String>
    {
        return ["语法","常识","界面","iOS","操作","数据结构","多线程","网络","多媒体","安全"]
    }
    class func toJSONString(dict:Dictionary<String, Any>!)->NSString
    {
        do
        {
            let data = try JSONSerialization.data(withJSONObject: dict, options: .init(rawValue: 0))
            let strJson = NSString(data: data, encoding: String.Encoding.utf8.rawValue)
            return strJson!
        }
        catch
        {
            return ""
        }
        
    }
    
    class func getRandomQuiz() -> Array<Question>
    {
        let plistPath = Bundle.main.path(forResource: "quiz", ofType: "plist")
        let plistData = NSMutableDictionary.init(contentsOfFile: plistPath!)!
        let pagesData = plistData as! Dictionary<String, Array<Dictionary<String, Any>>>
        let quizzes = pagesData["quiz"]
        
        let randomList = Util.getRandomInList(start: 1, end: 600)
        var result = Array<Question>()
        for num in randomList
        {
            var questionDic = quizzes![Int(num)-1]
            questionDic["sequence"] = num
            let jsonData = Data.toJSONString(dict:questionDic).data(using: String.Encoding.utf8.rawValue)
            let decoder = JSONDecoder()
            let question = try! decoder.decode(Question.self, from: jsonData!)
            result.append(question)
        }
        return result
    }
    
    class func getAllSectionData(section:Array<String>) -> Array<Array<Question>>
    {
        let plistPath = Bundle.main.path(forResource: "quiz", ofType: "plist")
        let plistData = NSMutableDictionary.init(contentsOfFile: plistPath!)!
        let pagesData = plistData as! Dictionary<String, Array<Dictionary<String, Any>>>
        
        var allSectionData = Array<Array<Question>>()
        for _ in 1...10
        {
            let array = Array<Question>()
            allSectionData.append(array)
        }
        
        let quizzes = pagesData["quiz"]
        let count = quizzes!.count
        
        for i in 0...count-1
        {
            var quiz = quizzes![i]
            quiz["sequence"] = i+1
            let jsonData = toJSONString(dict:quiz).data(using: String.Encoding.utf8.rawValue)
            let decoder = JSONDecoder()
            let question = try! decoder.decode(Question.self, from: jsonData!)
            let tags = quiz["tags"] as! Array<String>
            for string in tags
            {
                switch string
                {
                    case section[0]:
                        allSectionData[0].append(question)
                    case section[1]:
                        allSectionData[1].append(question)
                    case section[2]:
                        allSectionData[2].append(question)
                    case section[3]:
                        allSectionData[3].append(question)
                    case section[4]:
                        allSectionData[4].append(question)
                    case section[5]:
                        allSectionData[5].append(question)
                    case section[6]:
                        allSectionData[6].append(question)
                    case section[7]:
                        allSectionData[7].append(question)
                    case section[8]:
                        allSectionData[8].append(question)
                    case section[9]:
                        allSectionData[9].append(question)
                    default: break
                    
                }
            }
        }
        return allSectionData
    }
    class func getAllQuestions() -> Array<Question>
    {
        let plistPath = Bundle.main.path(forResource: "quiz", ofType: "plist")
        let plistData = NSMutableDictionary.init(contentsOfFile: plistPath!)!
        let pagesData = plistData as! Dictionary<String, Array<Dictionary<String, Any>>>
        
        var allQuestions = Array<Question>()
        let quizzes = pagesData["quiz"]
        let count = quizzes!.count
        
        for i in 0...count-1
        {
            var quiz = quizzes![i]
            quiz["sequence"] = i+1
            let jsonData = toJSONString(dict:quiz).data(using: String.Encoding.utf8.rawValue)
            let decoder = JSONDecoder()
            let question = try! decoder.decode(Question.self, from: jsonData!)
            allQuestions.append(question)
        }
        return allQuestions
    }
    
    class func getAllInterviews() -> Array<Interview>
    {
        let plistPath = Bundle.main.path(forResource: "quiz", ofType: "plist")
        let plistData = NSMutableDictionary.init(contentsOfFile: plistPath!)!
        let pagesData = plistData as! Dictionary<String, Array<Dictionary<String, Any>>>
        
        var allInterviews = Array<Interview>()
        let quizzes = pagesData["interview"]
        let count = quizzes!.count
        
        for i in 0...count-1
        {
            var quiz = quizzes![i]
            quiz["sequence"] = i+1
            let jsonData = toJSONString(dict:quiz).data(using: String.Encoding.utf8.rawValue)
            let decoder = JSONDecoder()
            let interview = try! decoder.decode(Interview.self, from: jsonData!)
            allInterviews.append(interview)
        }
        return allInterviews
    }
    
    class func getAllFailedQuestions() -> Array<Question>
    {
        let allQuestions = getAllQuestions()
        var failedQuestions = Array<Question>()
        for i in 1...600
        {
            if Data.isIncorrectQuestion(sequence: i)
            {
                failedQuestions.append(allQuestions[i-1])
            }
        }
        
        return failedQuestions
    }
    class func getQuestionTypeName(question: Question) ->QuestionType
    {
        let right = question.right
        if right.count == 1
        {
            let answers = question.answers
            if answers[2] == "0"
            {
                return .判断题
            }
            else
            {
                return .单选题
            }
        }
        else
        {
            return .多选题
        }
    }
    
    //MARK: -
    //MARK: 答题次数
    class func appendSubmitQuestionCount(section: Int)
    {
        let key = "sectionSubmitQuestionCount\(section)"
        var oldCount = getSubmitQuestionCount(section: section)
        oldCount += 1
        UserDefaults.standard.set(oldCount, forKey: key)
        UserDefaults.standard.synchronize()
    }
    
    class func getSubmitQuestionCount(section:Int) -> Int
    {
        let key = "sectionSubmitQuestionCount\(section)"
        return UserDefaults.standard.integer(forKey: key)
    }
    
    class func appendSubmitQuestionCorrectCount(section: Int)
    {
        let key = "sectionSubmitQuestionCorrectCount\(section)"
        var oldCount = getSubmitQuestionCorrectCount(section: section)
        oldCount += 1
        UserDefaults.standard.set(oldCount, forKey: key)
        UserDefaults.standard.synchronize()
    }
    
    class func getSubmitQuestionCorrectCount(section:Int) -> Int
    {
        let key = "sectionSubmitQuestionCorrectCount\(section)"
        return UserDefaults.standard.integer(forKey: key)
    }
    
    
    //MARK: -
    //MARK: 问题序号
    class func getStoredQuestionNumber(section:Int) -> Int
    {
        let key = "storedQuestionNumber_\(section)"
        var number = UserDefaults.standard.integer(forKey: key)
        if number == 0
        {
            number = 1
        }
        return number
    }
    class func setStoredQuestionNumber(section:Int, seq:Int)
    {
        let key = "storedQuestionNumber_\(section)"
        UserDefaults.standard.set(seq, forKey: key)
        UserDefaults.standard.synchronize()
    }
    
    class func getStoredEndQuestionNumber(section:Int) -> Int
    {
        let key = "storedEndQuestionNumber_\(section)"
        var number = UserDefaults.standard.integer(forKey: key)
        if number == 0
        {
            number = 1
        }
        return number
    }
    class func setStoredEndQuestionNumber(section:Int, seq:Int)
    {
        let key = "storedEndQuestionNumber_\(section)"
        UserDefaults.standard.set(seq, forKey: key)
        UserDefaults.standard.synchronize()
    }
    
    class func setStoredCorrectNumber(section:Int, count:Int)
    {
        let key = "storedCorrectNumber_\(section)"
        UserDefaults.standard.set(count, forKey: key)
        UserDefaults.standard.synchronize()
    }
    
    class func getStoredCorrectNumber(section:Int) -> Int
    {
        let key = "storedCorrectNumber_\(section)"
        return UserDefaults.standard.integer(forKey: key)
    }
    
    class func setStoredIncorrectNumber(section:Int, count:Int)
    {
        let key = "storedIncorrectNumber_\(section)"
        UserDefaults.standard.set(count, forKey: key)
        UserDefaults.standard.synchronize()
    }
    
    class func getStoredIncorrectNumber(section:Int) -> Int
    {
        let key = "storedIncorrectNumber_\(section)"
        return UserDefaults.standard.integer(forKey: key)
    }
    
    //MARK: -
    //MARK: 查看答案次数
    class func updateAnswerCount(num:Int)
    {
        var count = getViewAnswerCount()
        count += num
        
        UserDefaults.standard.set(count, forKey: "ViewAnswerCount")
        UserDefaults.standard.synchronize()
    }
    class func getViewAnswerCount() -> Int
    {
        let hasGetFirst100Counts = UserDefaults.standard.bool(forKey: "hasGetFirst100Counts")
        if !hasGetFirst100Counts
        {
            UserDefaults.standard.set(true, forKey: "hasGetFirst100Counts")
            UserDefaults.standard.set(100, forKey: "ViewAnswerCount")
            UserDefaults.standard.synchronize()
            
            return 100
        }
        else
        {
            var count = UserDefaults.standard.integer(forKey: "ViewAnswerCount")
            if count < 0
            {
                count = 0
            }
            
            return count
        }
    }
    
    //MARK: -
    //MARK: 错题相关
    class func setIncorrectQuestion(question:Question)
    {
        let key = "IncorrectQuestion_\(question.sequence)"
        UserDefaults.standard.set(true, forKey: key)
        UserDefaults.standard.synchronize()
    }
    class func removeIncorrectQuestion(question:Question)
    {
        let key = "IncorrectQuestion_\(question.sequence)"
        UserDefaults.standard.set(false, forKey: key)
        UserDefaults.standard.synchronize()
    }
    class func isIncorrectQuestion(sequence:Int) -> Bool
    {
        let key = "IncorrectQuestion_\(sequence)"
        return UserDefaults.standard.bool(forKey: key)
    }
    
    class func isIncorrectQuestionOpen(sequence:Int) -> Bool
    {
        let key = "isIncorrectQuestionOpen_\(sequence)"
        return UserDefaults.standard.bool(forKey: key)
    }
    class func openIncorrectQuestion(sequence:Int)
    {
        let key = "isIncorrectQuestionOpen_\(sequence)"
        UserDefaults.standard.set(true, forKey: key)
        UserDefaults.standard.synchronize()
    }
    
    //MARK: -
    //MARK: 面试题相关
    class func setCurrentInterview(sequence:Int)
    {
        UserDefaults.standard.set(sequence, forKey: "currentInterview")
        UserDefaults.standard.synchronize()
    }
    class func getCurrentInterview() -> Int
    {
        var sequence = UserDefaults.standard.integer(forKey: "currentInterview")
        if sequence == 0
        {
            sequence = 1
        }
        return sequence
    }
    class func isInterviewOpen(sequence:Int) -> Bool
    {
        return UserDefaults.standard.bool(forKey: "isInterviewOpen_\(sequence)")
    }
    
    class func openMianShiTi(sequence:Int)
    {
        UserDefaults.standard.set(true, forKey: "isInterviewOpen_\(sequence)")
        UserDefaults.standard.synchronize()
    }
    
    class func hasShowIntro() -> Bool
    {
        return UserDefaults.standard.bool(forKey: "hasShowIntro")
    }
    
    class func setShowIntroToTrue()
    {
        UserDefaults.standard.set(true, forKey: "hasShowIntro")
        UserDefaults.standard.synchronize()
    }
}
