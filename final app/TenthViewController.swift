//
//  TenthViewController.swift
//  final app
//
//  Created by 小野颯真 on 2020/04/04.
//  Copyright © 2020 matope. All rights reserved.
//

import UIKit

class TenthViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        label.numberOfLines = 2
        label.text = "ここに指定の書式で\n書き込んでください"
        textField.delegate = self
    }
        
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // キーボードを閉じる
        textField.resignFirstResponder()
        return true
    }
        
    // ①セグエ実行前処理
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // ②Segueの識別子確認
        if segue.identifier == "toViewTwelve" {
        
            // ③遷移先ViewCntrollerの取得
            let nextView = segue.destination as! TwelvethViewController
        
            // ④値の設定
            var a = [String]()
            var b = [String]()
            var c = [[String]]()
            a = textField.text!.components(separatedBy: ":")
            for i in a {
                b = i.components(separatedBy: "/")
                c.append(b)
            }
            nextView.arr = c
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

