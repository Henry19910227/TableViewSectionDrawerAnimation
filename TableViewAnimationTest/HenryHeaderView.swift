//
//  HenryHeaderView.swift
//  TableViewAnimationTest
//
//  Created by 廖冠翰 on 2018/10/2.
//  Copyright © 2018年 廖冠翰. All rights reserved.
//

import UIKit

protocol HenryHeaderViewDelegate: AnyObject {
    
    func henryHeaderView(_ headerView: HenryHeaderView, didSelectAt index: Int)
}

class HenryHeaderView: UIView {
    
    public weak var delegate: HenryHeaderViewDelegate?
    
    public var index = 0

    class func headerView() -> HenryHeaderView {
        
        let headerView = Bundle.main.loadNibNamed("HenryHeaderView", owner: nil, options: nil)?.first
        
        return headerView as! HenryHeaderView
    }
    
    @IBAction func headerViewButtonClick() {
        
        self.delegate?.henryHeaderView(self, didSelectAt: index)
    }
    
}
