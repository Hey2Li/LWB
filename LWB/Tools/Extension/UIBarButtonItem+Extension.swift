//
//  UIBarButtonItem+Extension.swift
//  LWB
//
//  Created by Lee on 2018/11/29.
//  Copyright © 2018 Lee. All rights reserved.
//

import UIKit

extension UIBarButtonItem {
    
    /// 创建UIBarButtonItem
    ///
    /// - Parameters:
    ///   - title: title
    ///   - fontSize: fontSize 默认16号
    ///   - target: target
    ///   - action: action
    convenience init(title : String, fontSize : CGFloat = 16, target : AnyObject?, action : Selector) {
        let btn : UIButton = UIButton.cz_textButton(title, fontSize: fontSize, normalColor: UIColor.darkGray, highlightedColor: UIColor.orange)
        btn.addTarget(target, action: action, for: .touchUpInside)
        
        //self.init实例化UIBarButtonItem
        self.init(customView: btn)
    }
}
