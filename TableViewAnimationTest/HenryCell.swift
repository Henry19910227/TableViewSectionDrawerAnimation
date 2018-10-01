//
//  HenryCell.swift
//  TableViewAnimationTest
//
//  Created by 廖冠翰 on 2018/10/1.
//  Copyright © 2018年 廖冠翰. All rights reserved.
//

import UIKit

class HenryCell: UITableViewCell {
    
    @IBOutlet private weak var contentLabel: UILabel!
    
    public var title = "" {
        didSet {
            contentLabel.text = title
        }
    }
}
