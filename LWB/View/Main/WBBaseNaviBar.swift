//
//  WBBaseNaviBar.swift
//  LWB
//
//  Created by Lee on 2018/11/30.
//  Copyright © 2018 Lee. All rights reserved.
//

import UIKit

class WBBaseNaviBar: UINavigationBar {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    override func layoutSubviews() {
        super.layoutSubviews()
        for subview in subviews {
            let subName = NSStringFromClass(subview.classForCoder)
            if subName == "_UIBarBackground" {
                subview.frame = bounds
            }else if subName == "_UINavigationBarContentView" {
                var frame = subview.frame;
                frame.origin.y =  20
                frame.size.height = self.bounds.size.height - frame.origin.y;
                subview.frame = frame;
            }
        }
    }

}
