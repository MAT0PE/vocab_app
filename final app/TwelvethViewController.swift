//
//  TwelvethViewController.swift
//  final app
//
//  Created by 小野颯真 on 2020/04/04.
//  Copyright © 2020 matope. All rights reserved.
//

import UIKit

class TwelvethViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var arr = [[String]]()

    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func tapButton(_ sender: Any) {
        let f = DateFormatter()
        f.dateStyle = .long
        f.timeStyle = .none
        f.locale = Locale(identifier: "ja_JP")
        let today = f.string(from: Date())
        
        let userDefaults = UserDefaults.standard
        var temporary = [[String]]()
        if userDefaults.object(forKey: today) != nil {
            temporary = userDefaults.object(forKey: today)! as! [[String]]
        }
        for i in arr {
            temporary.append(i)
        }
        userDefaults.set(temporary, forKey: today)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.register (UINib(nibName: "CustomCell", bundle: nil),forCellReuseIdentifier:"reusableCell")
        
//        a = argString.components(separatedBy: ":")
//        for i in a {
//            b = i.components(separatedBy: "/")
//            c.append(b)
//        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let 表示するセルの内容 = tableView.dequeueReusableCell(withIdentifier: "reusableCell", for: indexPath) as! CustomCell
        表示するセルの内容.セルに表示するデータの制御 ( hoge : indexPath, array: arr)
        return 表示するセルの内容
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
