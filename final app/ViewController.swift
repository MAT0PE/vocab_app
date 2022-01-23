//
//  ViewController.swift
//  final app
//
//  Created by 小野颯真 on 2020/04/03.
//  Copyright © 2020 matope. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        label.text = "可哀想な学畜の\n単語帳アプリ"
        label.numberOfLines = 2
        
        var keys = ["AKLastIDMSEnvironment", "AddingEmojiKeybordHandled", "AppleITunesStoreItemKinds", "AppleKeyboards", "AppleKeyboardsExpanded", "AppleLanguages", "AppleLanguagesSchemaVersion", "ApplePasscodeKeyboards", "CarCapabilities", "NSInterfaceStyle", "NSLanguages", "PKKeychainVersionKey", "today", "today_v"]
        let f = DateFormatter()
        f.dateStyle = .long
        f.timeStyle = .none
        f.locale = Locale(identifier: "ja_JP")
        let today = Date()
        keys.append(f.string(from: today))
        keys.append(f.string(from: today)+"check")
        var modifiedDate = Date()
        for i in 1...16 {
            modifiedDate = Calendar.current.date(byAdding: .day, value: -i, to: today)!
            keys.append(f.string(from: modifiedDate))
            keys.append(f.string(from: modifiedDate)+"check")
        }
        let userDefaults = UserDefaults.standard
        var check = Bool()
        for dic in userDefaults.dictionaryRepresentation().sorted(by: { $0.0 < $1.0 }) {
            check = false
            for k in keys {
                if dic.key == k {
                    check = true
                    break
                }
            }
            if !check {
                userDefaults.set(nil, forKey: dic.key)
            }
        }
    }


}

