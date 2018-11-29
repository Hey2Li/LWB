//
//  WBMainViewController.swift
//  LWB
//
//  Created by Lee on 2018/11/29.
//  Copyright © 2018 Lee. All rights reserved.
//

import UIKit

class WBMainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupChildControllers()
    }
}
//类似于OC的分类 在swift中可以用来切换代码块
//注意 和OC的分类一样 extension中不能定义属性
// MARK: - 设置界面
extension WBMainViewController {
    private func setupChildControllers() {
        let array = [
            ["clsName" : "WBHomeViewController" , "title" : "首页" , "imageName" : "home"],
            ["clsName" : "WBMessageViewController" , "title" : "首页" , "imageName" : "message_center"],
            ["clsName" : "WBDiscoverViewController" , "title" : "首页" , "imageName" : "discover"],
            ["clsName" : "WBProfileViewController" , "title" : "首页" , "imageName" : "profile"],
        ]
        var arrayM = [UIViewController]()
        for dict in array {
            arrayM.append(controller(dict: dict))
        }
        viewControllers = arrayM
    }
    
    private func  controller(dict : [String : String]) -> UIViewController {
        //1.取得字典内容
        guard let clsName = dict["clsName"],let title = dict["title"],let imageName = dict["imageName"],let cls = NSClassFromString(Bundle.main.namespace + "." + clsName) as? UIViewController.Type
        else {
            return UIViewController()
        }
        //创建视图控制器
        //将clsName 转成 cls
        let vc = cls.init().self
        vc.title = title
        
        //设置图片
        vc.tabBarItem.image = UIImage(named: "tabbar_" + imageName)
        vc.tabBarItem.selectedImage = UIImage(named: "tabbar_" + imageName + "_selected")?.withRenderingMode(.alwaysOriginal)
        let nav = WBNavigationViewController(rootViewController: vc)
        return nav
    }
}
