//
//  ThirdViewController.swift
//  final app
//
//  Created by 小野颯真 on 2020/04/03.
//  Copyright © 2020 matope. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    
    var check = false
    var check1 = Int()
    var check2 = Int()
    
    @IBAction func firstSegmented(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            check1 = 0
        case 1:
            check1 = 1
        default:
            check1 = 0
        }
    }
    @IBAction func secondSegmented(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            check2 = 0
        case 1:
            check2 = 1
        default:
            check2 = 0
        }
    }
    
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        label.numberOfLines = 2
        
        let f = DateFormatter()
        f.dateStyle = .long
        f.timeStyle = .none
        f.locale = Locale(identifier: "ja_JP")
        let today = Date()
        let userDefaults = UserDefaults.standard
        var modifiedDate = Date()
        for i in [1, 2, 4, 8, 16] {
            modifiedDate = Calendar.current.date(byAdding: .day, value: -i, to: today)!
            if userDefaults.object(forKey: f.string(from: modifiedDate)) != nil {
                check = true
            }
        }
        if check {
            if userDefaults.object(forKey: f.string(from: today)+"check") != nil {
                if userDefaults.object(forKey: f.string(from: today)+"check")! as! Int == 2 {
                    label.text = "本日の学習は\n終了しました"
                }
                else {
                    label.text = "以下の項目を選択してから\n次に進んで下さい"
                }
            }
            else {
                label.text = "以下の項目を選択してから\n次に進んで下さい"
            }
        }
        else {
            label.text = "本日学習する単語\nはありません"
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
           // ②Segueの識別子確認
           if segue.identifier == "toViewFour" {
    
               // ③遷移先ViewCntrollerの取得
               let nextView = segue.destination as! FourthViewController
    
               // ④値の設定
               nextView.argCheck = check1
           }
            if segue.identifier == "toViewFive" {
            
                // ③遷移先ViewCntrollerの取得
                let nextView = segue.destination as! FifthViewController
            
                // ④値の設定
                nextView.argCheck = check1
            }
       }
    
    @IBAction func buttonTap(_ sender: Any) {
        if check {
            if check2 == 0 {
                performSegue(withIdentifier: "toViewFour", sender: nil)
            
            }
            else {
                performSegue(withIdentifier: "toViewFive", sender: nil)
            }
        }
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
