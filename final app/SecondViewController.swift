//
//  SecondViewController.swift
//  final app
//
//  Created by 小野颯真 on 2020/04/03.
//  Copyright © 2020 matope. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var word: UITextField!
    @IBOutlet weak var meaning: UITextField!
    @IBOutlet weak var sentence: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        word.delegate = self
        meaning.delegate = self
        sentence.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // キーボードを閉じる
        textField.resignFirstResponder()
        return true
    }
    
    // ①セグエ実行前処理
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
        // ②Segueの識別子確認
        if segue.identifier == "toViewSix" && word.text != nil && meaning.text != nil{
    
            // ③遷移先ViewCntrollerの取得
            let nextView = segue.destination as! SixthViewController
    
            // ④値の設定
            nextView.argWord = word.text!
            nextView.argMeaning = meaning.text!
            if sentence.text != nil {
                nextView.argSentence = sentence.text!
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
