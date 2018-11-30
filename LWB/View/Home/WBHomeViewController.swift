//
//  WBHomeViewController.swift
//  LWB
//
//  Created by Lee on 2018/11/29.
//  Copyright © 2018 Lee. All rights reserved.
//

import UIKit

class WBHomeViewController: WBBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    //显示好友
    @objc private func showFriends() {
        print(#function)
        let vc = WBDemoViewController()
        //
        navigationController?.pushViewController(vc, animated: true)
        
    }
}
//设置UI
extension WBHomeViewController {
    //重写父类的方法
    override func setupUI() {
        super.setupUI()
        //无法高亮
        naviItem.leftBarButtonItem = UIBarButtonItem(title: "好友", fontSize: 16, target: self, action: #selector(showFriends))
    }
}
