//
//  WBBaseViewController.swift
//  LWB
//
//  Created by Lee on 2018/11/29.
//  Copyright © 2018 Lee. All rights reserved.
//

import UIKit

class WBBaseViewController: UIViewController {
    
    /// 自定义导航条
    lazy var navigationBar : UINavigationBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: UIScreen.cz_screenWidth(), height: 84))
    lazy var naviItem = UINavigationItem()//自定义的导航项
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.cz_random()
        setupUI()
    }
    override var title: String? {
        didSet {
            naviItem.title = title
        }
    }
}
// 设置界面
extension WBBaseViewController {
    @objc func setupUI() {
        view.backgroundColor = UIColor.cz_random()
        
        //添加导航条
        view.addSubview(navigationBar)
        //将item设置给bar
        navigationBar.items = [naviItem]
    }
}
