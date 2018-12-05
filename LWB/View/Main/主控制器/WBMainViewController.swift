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
        setupComposeButton()
    }
    //portarit 竖屏 肖像
    //landscape 横屏 风景画
    //使用代码控制设备的方向 好处可以在需要横屏的时候 单独出来
    //设置支持的方向后 当前的控制器及子控制器都会遵守这个方向
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    //MARK:- 私有控件
    private lazy var composeButton : UIButton = UIButton.cz_imageButton("tabbar_compose_icon_add", backgroundImageName: "tabbar_compose_button")
}
//类似于OC的分类 在swift中可以用来切换代码块
//注意 和OC的分类一样 extension中不能定义属性
// MARK: - 设置界面
extension WBMainViewController {
    private func setupComposeButton () {
        tabBar.addSubview(composeButton)
        //计算的按钮的宽度
        let count  = children.count
        //将向内缩进的宽度减少 盖住容错点
        let w = tabBar.bounds.width / CGFloat(count) - 1
        
        //CGRectInset 正数向内 负数向外
        composeButton.frame = tabBar.bounds.insetBy(dx: 2 * w, dy: 0)
        
        composeButton.addTarget(self, action: #selector(composeStatus), for: .touchUpInside)
    }
    //MARK:- 监听方法
    //撰写微博
    //private 能够保证方法私有 仅在当前对象被访问
    //@objc 荀彧这个函数在运行时通过OC的消息机制调用
    @objc private func composeStatus() {
        print("撰写微博")
        
        let vc = UIViewController()
        vc.view.backgroundColor = UIColor.cz_random()
        let nav = UINavigationController(rootViewController: vc)
        present(nav, animated: true, completion: nil)
    }
    private func setupChildControllers() {
        //现在很多的应用程序中，界面的穿件都依赖网络的JSON
        let array : [[String : Any]] = [
            ["clsName" : "WBHomeViewController" , "title" : "首页" , "imageName" : "home" ,
             "visitorInfo" : ["imageName" : "" , "message" : "关注一些人，回这里看看有什么惊喜"]
             ],
            ["clsName" : "WBMessageViewController" , "title" : "消息" , "imageName" : "message_center",
             "visitorInfo" : ["imageName" : "visitordiscover_image_message" , "message" : "登录后，被人评论你的微博，发给你的消息，都会在这里收到通知"]],
            ["clsName" : "UIViewController"],
            ["clsName" : "WBDiscoverViewController" , "title" : "发现" , "imageName" : "discover",
             "visitorInfo" : ["imageName" : "visitordiscover_image_message" , "message" : "登录后，最新、最热微博尽在掌握，不会与实时潮流擦肩而过"]],
            ["clsName" : "WBProfileViewController" , "title" : "我" , "imageName" : "profile",
             "visitorInfo" : ["imageName" : "visitordiscover_image_profile" , "message" : "登录后，你的想微博、相册、个人资料会显示在这里，展示给别人"]],
        ]
//        测试数据格式是否正确 转化成plist数据更加直观
//        (array as NSArray).write(toFile: "/Users/lee/Desktop/demo.plist", atomically: true)
        var arrayM = [UIViewController]()
        for dict in array {
            arrayM.append(controller(dict: dict))
        }
        viewControllers = arrayM
    }
    
    private func  controller(dict : [String : Any]) -> UIViewController {
        //1.取得字典内容
        guard
            let clsName = dict["clsName"] as? String,
            let title = dict["title"] as? String,
            let imageName = dict["imageName"] as? String ,
            let cls = NSClassFromString(Bundle.main.namespace + "." + clsName) as? WBBaseViewController.Type,
            let visitorDict = dict["visitorInfo"] as? [String : String]
        
        else {
            return UIViewController()
        }
        //创建视图控制器
        //将clsName 转成 cls
        let vc = cls.init().self
        vc.title = title
        //设置控制器的访客信息字典
        vc.visitorInfoDictionary = visitorDict
        
        //设置图片
        vc.tabBarItem.image = UIImage(named: "tabbar_" + imageName)
        vc.tabBarItem.selectedImage = UIImage(named: "tabbar_" + imageName + "_selected")?.withRenderingMode(.alwaysOriginal)
        //设置tabbar标题字体（大小）
    vc.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor:UIColor.orange], for: .highlighted)
        //系统默认是12号字体 修改字体大小 要用Normal的字体大小
        vc.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.font : UIFont.systemFont(ofSize: 12)], for: UIControl.State.normal)
        
        let nav = WBNavigationViewController(rootViewController: vc)
        
        return nav
    }
}
