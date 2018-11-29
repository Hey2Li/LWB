//
//  WBNavigationViewController.swift
//  LWB
//
//  Created by Lee on 2018/11/29.
//  Copyright © 2018 Lee. All rights reserved.
//

import UIKit

class WBNavigationViewController: UINavigationController {
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        //如果不是栈低的控制器才需要隐藏 根控制器不需要
        if children.count > 0 {
            //隐藏底部的Tabbar
            viewController.hidesBottomBarWhenPushed = true
        }
        
        super.pushViewController(viewController, animated: true)
    }
}
