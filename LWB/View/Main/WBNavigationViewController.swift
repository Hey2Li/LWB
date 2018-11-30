//
//  WBNavigationViewController.swift
//  LWB
//
//  Created by Lee on 2018/11/29.
//  Copyright © 2018 Lee. All rights reserved.
//

import UIKit

class WBNavigationViewController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //隐藏默认的navigationBar
        navigationBar.isHidden = true
    }
    //重写push方法 ，所有的动作都会调用此方法
    //viewcontroller 是被push的控制器，设置他的左侧的按钮 作为返回按钮
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        //如果不是栈低的控制器才需要隐藏 根控制器不需要
        if children.count > 0 {
            //隐藏底部的Tabbar
            viewController.hidesBottomBarWhenPushed = true
        }
        //判断控制器的类型
        if let vc = viewController as? WBBaseViewController {
            var title = "返回"
            //判断控制器的级数
            if children.count == 1 {
                //title 显示首页标题
                title = children.first?.title ?? "返回"
            }
            //取出自定义的naviitem
            vc.naviItem.leftBarButtonItem = UIBarButtonItem(title: title, target: self, action: #selector(popToParent))
        }
        super.pushViewController(viewController, animated: true)
    }
    //pop返回上一句控制器
    @objc private func popToParent () {
        popViewController(animated: true)
    }
}
