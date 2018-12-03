//
//  WBHomeViewController.swift
//  LWB
//
//  Created by Lee on 2018/11/29.
//  Copyright © 2018 Lee. All rights reserved.
//

import UIKit

/// 定义全局常量 尽量使用private修饰
private let cellId = "cellId"
class WBHomeViewController: WBBaseViewController {
    
    private lazy var statusList = [String]()
    /// 加载数据
    override func loadData() {
        for i in 0..<10 {
            //将数据插入数组的顶部
            statusList.insert(i.description, at: 0)
        }
    }
    //显示好友
    @objc private func showFriends() {
        print(#function)
        let vc = WBDemoViewController()
        //
        navigationController?.pushViewController(vc, animated: true)
        
    }
}

// MARK: - 表格数据源方法 具体的数据源方法不需要super
extension WBHomeViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return statusList.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //取cell
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        //设置cell
        cell.textLabel?.text = statusList[indexPath.row]
        //返回cell
        return cell
    }
}
//设置UI
extension WBHomeViewController {
    //重写父类的方法
    override func setupUI() {
        super.setupUI()
        //无法高亮
        naviItem.leftBarButtonItem = UIBarButtonItem(title: "好友", fontSize: 16, target: self, action: #selector(showFriends))
        
        tableView?.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
    }
}
