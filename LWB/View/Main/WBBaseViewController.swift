//
//  WBBaseViewController.swift
//  LWB
//
//  Created by Lee on 2018/11/29.
//  Copyright © 2018 Lee. All rights reserved.
//

import UIKit
//OC 中支持多继承吗 如果不支持 如何替代 答案使用协议替代
//Swift的写法更类似于多继承
//class WBBaseViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
//swift 利用extension可以把函数按照功能分类管理 便于阅读和维护
//注意：
//1,extension中不能有属性
//2,extension不能重写父类方法 重写父类方法 是子类的职责 扩展对类的扩展

class WBBaseViewController: UIViewController {
    //表格视图  没有登录就不加载
    var tableView : UITableView?
    //属性控件
    var refreshControl : UIRefreshControl?
    /// 上拉刷新标记
    var isPullup = false
    
    /// 自定义导航条
    lazy var navigationBar : WBBaseNaviBar = WBBaseNaviBar(frame: CGRect(x: 0, y: 0, width: UIScreen.cz_screenWidth(), height: 64))
    //自定义的导航项
    lazy var naviItem = UINavigationItem()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.cz_random()
        //取消自动缩进 如果隐藏了导航栏会缩进20个点
//        automaticallyAdjustsScrollViewInsets = false
        setupUI()
        loadData()
    }
    override var title: String? {
        didSet {
            naviItem.title = title
        }
    }
    
    /// 加载数据
    @objc func loadData() {
        
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
        //设置数据源&代理 目的 子类直接实现数据源方法
        tableView?.delegate = self
        tableView?.dataSource = self
        
        tableView?.contentInset = UIEdgeInsets(top: navigationBar.bounds.height - 20, left: 0, bottom: 0, right: 0)
        
        //设置刷新控件
        //1.实例化控件
        refreshControl = UIRefreshControl()
        //添加到视图
        tableView?.addSubview(refreshControl!)
        //添加监听方法
        refreshControl?.addTarget(self, action: #selector(loadData), for: .valueChanged)
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
extension WBBaseViewController : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    //基类只是准备方法 子类负责具体的实现
    //子类的数据源方法不需要super
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //只是保证没有语法错误
        return UITableViewCell()
    }
    //在显示最后一行的时候做上拉刷新
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        //1.判断indexPath 是否是最后一行（indexp。section (最大)/index.row（最后一行））
        let row = indexPath.row
        //section
        let section = tableView.numberOfSections - 1
        if row < 0 || section < 0 {
            return
        }
        
        let count = tableView.numberOfRows(inSection: section)
        //如果是最后一行 同时没有开始上拉刷新
        if row == (count - 1) && !isPullup {
            print("上拉刷新")
        }
    }
}
