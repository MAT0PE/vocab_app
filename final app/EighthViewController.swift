//
//  EighthViewController.swift
//  final app
//
//  Created by 小野颯真 on 2020/04/04.
//  Copyright © 2020 matope. All rights reserved.
//

import UIKit

class EighthViewController: UIViewController {

    @IBOutlet weak var explanation: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        explanation.text = "指定の書式では単語、意味、例文（任意）の順にスラッシュで区切りながら書いていきます。また、別の単語との境界にはコロンを用います。\n※ただしスラッシュとコロンは半角です。\n \n例）\nblue/青/The sky is blue.:red/赤:yellow/黄色/This banana is yellow."
        explanation.numberOfLines = 12
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
