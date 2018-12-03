//
//  WBBaseViewController.swift
//  LWB
//
//  Created by Lee on 2018/11/29.
//  Copyright © 2018 Lee. All rights reserved.
//

import UIKit

class WBBaseViewController: UIViewController {
    //表格视图  没有登录就不加载
    var tableView : UITableView?
    
    /// 自定义导航条
    lazy var navigationBar : WBBaseNaviBar = WBBaseNaviBar(frame: CGRect(x: 0, y: 0, width: UIScreen.cz_screenWidth(), height: 64))
    //自定义的导航项
    lazy var naviItem = UINavigationItem()
    
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
        setupNavigationBar()
        setupTableView()
    }
    private func setupTableView() {
        tableView = UITableView(frame: view.bounds, style: .plain)
        view.addSubview(tableView!)
        view.insertSubview(tableView!, belowSubview: navigationBar)
    }
    private func setupNavigationBar() {
        //添加导航条
        view.addSubview(navigationBar)
        //将item设置给bar
        navigationBar.items = [naviItem]
        //设置navBar整个背景的渲染颜色的渲染颜色
        navigationBar.barTintColor = UIColor.cz_color(withHex: 0xF6F6F6)
        //设置navBar 的字体颜色
        navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.darkGray]
    }
}
