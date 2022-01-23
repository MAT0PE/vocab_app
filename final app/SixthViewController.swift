//
//  SixthViewController.swift
//  final app
//
//  Created by 小野颯真 on 2020/04/03.
//  Copyright © 2020 matope. All rights reserved.
//

import UIKit

class SixthViewController: UIViewController {

    var argWord = String()
    var argMeaning = String()
    var argSentence = String()
    
    @IBOutlet weak var word: UILabel!
    @IBOutlet weak var meaning: UILabel!
    @IBOutlet weak var sentence: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        word.text = argWord
        meaning.text = argMeaning
        if argSentence == "" {
            sentence.text = "無し"
        }
        else {
            sentence.text = argSentence
        }
        sentence.text = argSentence
        sentence.numberOfLines = 3
    }
    
    @IBAction func buttonTap(_ sender: Any) {
        let f = DateFormatter()
        f.dateStyle = .long
        f.timeStyle = .none
        f.locale = Locale(identifier: "ja_JP")
        let today = f.string(from: Date())

        let userDefaults = UserDefaults.standard
        var array = [[String]]()
        if userDefaults.object(forKey: today) != nil {
            array = userDefaults.object(forKey: today)! as! [[String]]
        }
        var new = [String]()
        new.append(argWord)
        new.append(argMeaning)
        if sentence.text != nil {
            new.append(argSentence)
        }
        array.append(new)
        userDefaults.set(array, forKey: today)
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
