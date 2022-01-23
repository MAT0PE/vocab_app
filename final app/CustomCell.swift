//
//  CustomCell.swift
//  final app
//
//  Created by 小野颯真 on 2020/04/04.
//  Copyright © 2020 matope. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {
    
    func fun(array: Array<String>) -> String {
        var ret = String()
        for i in array {
            ret += i
            ret += ", "
        }
        ret = String(ret.prefix(ret.utf16.count-2))
        return ret
    }

    func セルに表示するデータの制御(hoge: IndexPath, array: Array<Array<String>>){
        
        self.label.text = fun(array: array[hoge.row])
    }

    @IBOutlet weak var label: UILabel!
    
    
}
