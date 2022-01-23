//
//  SeventhViewController.swift
//  final app
//
//  Created by 小野颯真 on 2020/06/23.
//  Copyright © 2020 matope. All rights reserved.
//

import UIKit

class SeventhViewController: UIViewController {

    var timer:Timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        logo.text = "可哀想な学畜の\n単語帳アプリ"
        logo.numberOfLines = 2
        
        timer = Timer.scheduledTimer(timeInterval: 3.0,
                                     target: self,
                                     selector: #selector(SeventhViewController.changeView),
                                     userInfo: nil,
                                     repeats: false)
    }
    
    @objc func changeView() {
        self.performSegue(withIdentifier: "toViewThree", sender: nil)
    }

    @IBOutlet weak var logo: UILabel!
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
