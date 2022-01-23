//
//  FifthViewController.swift
//  final app
//
//  Created by 小野颯真 on 2020/04/03.
//  Copyright © 2020 matope. All rights reserved.
//

import UIKit

class FifthViewController: UIViewController, UITextFieldDelegate {
    
    var argCheck = Int()
    var one = [[String]]()
    var two = [[String]]()
    var four = [[String]]()
    var eight = [[String]]()
    var sixteen = [[String]]()
    var oneLength = 0
    var twoLength = 0
    var fourLength = 0
    var eightLength = 0
    var array = [[String]]()
    var temporary = [[String]]()
    var counter = 0
    var date = String()
    var date_1 = String()
    var date_2 = String()
    var date_4 = String()
    var date_8 = String()
    var date_16 = String()

    @IBOutlet weak var word: UILabel!
    @IBOutlet weak var sentence: UILabel!
    @IBOutlet weak var answer: UILabel!
    @IBOutlet weak var circle: UILabel!
    @IBOutlet weak var cross: UILabel!
    @IBOutlet weak var count: UILabel!
    @IBOutlet weak var answerField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        answerField.delegate = self
        
        sentence.numberOfLines = 3
        
        let f = DateFormatter()
        f.dateStyle = .long
        f.timeStyle = .none
        f.locale = Locale(identifier: "ja_JP")
        let today = Date()
        date = f.string(from: today)
        var modifiedDate = Date()
        modifiedDate = Calendar.current.date(byAdding: .day, value: -1, to: today)!
        date_1 = f.string(from: modifiedDate)
        modifiedDate = Calendar.current.date(byAdding: .day, value: -2, to: today)!
        date_2 = f.string(from: modifiedDate)
        modifiedDate = Calendar.current.date(byAdding: .day, value: -4, to: today)!
        date_4 = f.string(from: modifiedDate)
        modifiedDate = Calendar.current.date(byAdding: .day, value: -8, to: today)!
        date_8 = f.string(from: modifiedDate)
        modifiedDate = Calendar.current.date(byAdding: .day, value: -16, to: today)!
        date_16 = f.string(from: modifiedDate)
        
        let userDefaults = UserDefaults.standard
        
        //今日初めての学習だった場合の各変数の初期化
        if userDefaults.object(forKey: date+"check") == nil {
            if userDefaults.object(forKey: date_1) != nil {
                temporary = userDefaults.object(forKey: date_1)! as! [[String]]
            }
            for temp in temporary {
                array.append(temp)
            }
            oneLength = temporary.count
            if userDefaults.object(forKey: date_2) != nil {
                temporary = userDefaults.object(forKey: date_2)! as! [[String]]
            }
            for temp in temporary {
                array.append(temp)
            }
            twoLength = temporary.count
            if userDefaults.object(forKey: date_4) != nil {
                temporary = userDefaults.object(forKey: date_4)! as! [[String]]
            }
            for temp in temporary {
                array.append(temp)
            }
            fourLength = temporary.count
            if userDefaults.object(forKey: date_8) != nil {
                temporary = userDefaults.object(forKey: date_8)! as! [[String]]
            }
            for temp in temporary {
                array.append(temp)
            }
            eightLength = temporary.count
            if userDefaults.object(forKey: date_16) != nil {
                temporary = userDefaults.object(forKey: date_16)! as! [[String]]
            }
            for temp in temporary {
                array.append(temp)
            }
            counter = 0
            userDefaults.set(nil, forKey: "today")
            userDefaults.set(nil, forKey: "today_v")
            temporary = [[String]]()
            if userDefaults.object(forKey: date) != nil {
                temporary = userDefaults.object(forKey: date)! as! [[String]]
            }
            for arr in array {
                temporary.append(arr)
            }
            userDefaults.set(temporary, forKey: date)
        }
            
        //今日二回目以降の学習だった場合の各変数の初期化
        else {
            var variables = Dictionary<String, Int>()
            array = userDefaults.object(forKey: "today")! as! [[String]]
            variables = userDefaults.object(forKey: "today_v")! as! [String: Int]
            counter = variables["counter"]!
            oneLength = variables["oneLength"]!
            twoLength = variables["twoLength"]!
            fourLength = variables["fourLength"]!
            eightLength = variables["eightLength"]!
        }
        answer.text = nil
        if argCheck == 0 {
            word.text = array[counter][0]
        }
        else {
            word.text = array[counter][1]
        }
        if array[counter].count == 2 {
            sentence.text = "例文無し"
        }
        else {
            sentence.text = nil
        }
        circle.text = nil
        cross.text = nil
        count.text = "\(counter+1)問目／\(array.count)問"
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // キーボードを閉じる
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func sentenceButton(_ sender: Any) {
        if counter < array.count {
            if array[counter].count == 3 {
                sentence.text = array[counter][2]
            }
        }
    }
    
    var trueAnswer = String()
    
    @IBAction func answerButton(_ sender: Any) {
        if counter < array.count {
            if argCheck == 0 {
                trueAnswer = array[counter][1]
            }
            else {
                trueAnswer = array[counter][0]
            }
            if answerField.text == trueAnswer {
                if counter < oneLength {
                    one.append(array[counter])
                }
                else if counter < oneLength + twoLength {
                    two.append(array[counter])
                }
                else if counter < oneLength + twoLength + fourLength {
                    four.append(array[counter])
                }
                else if counter < oneLength + twoLength + fourLength + eightLength {
                    eight.append(array[counter])
                }
                else {
                    sixteen.append(array[counter])
                }
                circle.text = "○"
            }
            else {
                cross.text = "×"
            }
            if argCheck == 0 {
                answer.text = "答えは「\(array[counter][1])」"
            }
            else {
                answer.text = "答えは”\(array[counter][0])”"
            }
            counter += 1
            if counter < array.count {
                if trueAnswer == answerField.text {
                    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
                        if self.argCheck == 0 {
                            self.word.text = self.array[self.counter][0]
                        }
                        else {
                            self.word.text = self.array[self.counter][1]
                        }
                        if self.array[self.counter].count == 2 {
                            self.sentence.text = "例文はありません"
                        }
                        else {
                            self.sentence.text = nil
                        }
                        self.circle.text = nil
                        self.answer.text = nil
                        self.answerField.text = nil
                        self.count.text = "\(self.counter+1)問目／\(self.array.count)問"
                    }
                }
                else {
                    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
                        if self.argCheck == 0 {
                            self.word.text = self.array[self.counter][0]
                        }
                        else {
                            self.word.text = self.array[self.counter][1]
                        }
                        if self.array[self.counter].count == 2 {
                            self.sentence.text = "例文はありません"
                        }
                        else {
                            self.sentence.text = nil
                        }
                        self.count.text = "\(self.counter+1)問目／\(self.array.count)問"
                        self.cross.text = nil
                        self.answer.text = nil
                        self.answerField.text = nil
                    }
                }
            }
            else {
                word.text = nil
                sentence.text = "学習は終了しました"
            }
        }
    }
    
    @IBAction func endButton(_ sender: Any) {
        let userDefaults = UserDefaults.standard
            
        //全ての単語を学習した場合の処理
        if counter == array.count {
            userDefaults.set(nil, forKey: "today")
            userDefaults.set(nil, forKey: "today_v")
            userDefaults.set(2, forKey: date+"check")
        }
            
        //中断する場合の処理
        else {
            userDefaults.set(array, forKey: "today")
            var variables = Dictionary<String, Int>()
            variables["counter"] = counter
            variables["oneLength"] = oneLength
            variables["twoLength"] = twoLength
            variables["fourLength"] = fourLength
            variables["eightLength"] = eightLength
            userDefaults.set(variables, forKey: "today_v")
            userDefaults.set(1, forKey: date+"check")
        }
            
        temporary = [[String]]()
        if userDefaults.object(forKey: date) != nil {
            temporary = userDefaults.object(forKey: date)! as! [[String]]
        }
        for d in one {
            temporary = temporary.filter { $0 != d }
        }
        for d in two {
            temporary = temporary.filter { $0 != d }
        }
        for d in four {
            temporary = temporary.filter { $0 != d }
        }
        for d in eight {
            temporary = temporary.filter { $0 != d }
        }
        for d in sixteen {
            temporary = temporary.filter { $0 != d }
        }
        userDefaults.set(temporary, forKey: date)
        temporary = [[String]]()
        if userDefaults.object(forKey: date_1) != nil {
            temporary = userDefaults.object(forKey: date_1)! as! [[String]]
        }
        for d in one {
            temporary.append(d)
        }
        userDefaults.set(temporary, forKey: date_1)
        temporary = [[String]]()
        if userDefaults.object(forKey: date_2) != nil {
            temporary = userDefaults.object(forKey: date_2)! as! [[String]]
        }
        for d in two {
            temporary.append(d)
        }
        userDefaults.set(temporary, forKey: date_2)
        temporary = [[String]]()
        if userDefaults.object(forKey: date_4) != nil {
            temporary = userDefaults.object(forKey: date_4)! as! [[String]]
        }
        for d in four {
            temporary.append(d)
        }
        userDefaults.set(temporary, forKey: date_4)
        temporary = [[String]]()
        if userDefaults.object(forKey: date_8) != nil {
            temporary = userDefaults.object(forKey: date_8)! as! [[String]]
        }
        for d in eight {
            temporary.append(d)
        }
        userDefaults.set(temporary, forKey: date_8)
        temporary = [[String]]()
        if userDefaults.object(forKey: date_16) != nil {
            temporary = userDefaults.object(forKey: date_16)! as! [[String]]
        }
        for d in sixteen {
            temporary.append(d)
        }
        userDefaults.set(temporary, forKey: date_16)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
