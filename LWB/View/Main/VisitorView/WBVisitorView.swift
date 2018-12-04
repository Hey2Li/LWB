//
//  WBVisitorView.swift
//  LWB
//
//  Created by Lee on 2018/12/4.
//  Copyright © 2018 Lee. All rights reserved.
//

import UIKit

/// 访客视图
class WBVisitorView: UIView {

    override init(frame : CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
extension WBVisitorView {
    func setupUI () {
        backgroundColor = UIColor.white
    }
}
