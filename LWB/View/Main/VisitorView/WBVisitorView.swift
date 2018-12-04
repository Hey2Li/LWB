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
    
    // MARK: - 私有控件
    /// 懒加载属性只有调用UIKit控件的指定构造函数，其他都需要使用类型
    /// 图像视图
    private lazy var iconView : UIImageView  = UIImageView(image: UIImage(named: "visitordiscover_feed_image_smallicon"))
    /// 小房子
    private lazy var houseIconView : UIImageView = UIImageView(image: UIImage(named: "visitordiscover_feed_image_house"))
    /// 提示标签
    private lazy var tipLabel : UILabel = UILabel.cz_label(
        withText: "关注一些人，回这里看看有什么惊喜",
        fontSize: 14,
        color: UIColor.darkGray)
    /// 注册按钮
    private lazy var registerButton : UIButton = UIButton.cz_textButton(
        "注册",
        fontSize: 14,
        normalColor: UIColor.orange,
        highlightedColor: UIColor.black,
        backgroundImageName: "common_button_white_disable")
    /// 登录按钮
    private lazy var loginButton : UIButton = UIButton.cz_textButton(
        "登录",
        fontSize: 14,
        normalColor: UIColor.darkGray,
        highlightedColor: UIColor.black,
        backgroundImageName: "common_button_white_disable")
}

// MARK: - 设置界面
extension WBVisitorView {
    func setupUI () {
        backgroundColor = UIColor.white
        
        //添加控件
        addSubview(iconView)
        addSubview(houseIconView)
        addSubview(tipLabel)
        addSubview(registerButton)
        addSubview(loginButton)
        
        //取消autoresizing
        for v in subviews {
            v.translatesAutoresizingMaskIntoConstraints = false
        }
        
        //设置自定布局
    /* Create constraints explicitly.  Constraints are of the form "view1.attr1 = view2.attr2 * multiplier + constant" */
        let margin : CGFloat = 20
        addConstraint(NSLayoutConstraint.init(item: iconView,
                                              attribute: .centerX,
                                              relatedBy: .equal,
                                              toItem: self,
                                              attribute: .centerX,
                                              multiplier: 1.0,
                                              constant: 0))
        addConstraint(NSLayoutConstraint.init(item: iconView,
                                              attribute: .centerY,
                                              relatedBy: .equal,
                                              toItem: self,
                                              attribute: .centerY,
                                              multiplier: 1.0,
                                              constant: 0))
        addConstraint(NSLayoutConstraint.init(item: houseIconView,
                                              attribute: .centerX,
                                              relatedBy: .equal,
                                              toItem: iconView,
                                              attribute: .centerX,
                                              multiplier: 1.0,
                                              constant: 0))
        addConstraint(NSLayoutConstraint.init(item: houseIconView,
                                              attribute: .centerY,
                                              relatedBy: .equal,
                                              toItem: iconView,
                                              attribute: .centerY,
                                              multiplier: 1.0,
                                              constant: 0))
        // 提示标签
        addConstraint(NSLayoutConstraint.init(item: tipLabel,
                                              attribute: .centerX,
                                              relatedBy: .equal,
                                              toItem: self,
                                              attribute: .centerX,
                                              multiplier: 1.0,
                                              constant: 0))
        addConstraint(NSLayoutConstraint.init(item: tipLabel,
                                              attribute: .top,
                                              relatedBy: .equal,
                                              toItem: iconView,
                                              attribute: .bottom,
                                              multiplier: 1.0,
                                              constant: margin))
        addConstraint(NSLayoutConstraint.init(item: tipLabel,
                                              attribute: .width,
                                              relatedBy: .equal,
                                              toItem: nil,
                                              attribute: .notAnAttribute,
                                              multiplier: 1.0,
                                              constant: 236))
        //注册按钮
        addConstraint(NSLayoutConstraint.init(item: registerButton,
                                              attribute: .left,
                                              relatedBy: .equal,
                                              toItem: tipLabel,
                                              attribute: .left,
                                              multiplier: 1.0,
                                              constant: 0))
        addConstraint(NSLayoutConstraint.init(item: registerButton,
                                              attribute: .top,
                                              relatedBy: .equal,
                                              toItem: tipLabel,
                                              attribute: .bottom,
                                              multiplier: 1.0,
                                              constant: margin))
        addConstraint(NSLayoutConstraint.init(item: registerButton,
                                              attribute: .width,
                                              relatedBy: .equal,
                                              toItem: nil,
                                              attribute: .notAnAttribute,
                                              multiplier: 1.0,
                                              constant: 100))
        //登录按钮
        addConstraint(NSLayoutConstraint.init(item: loginButton,
                                              attribute: .right,
                                              relatedBy: .equal,
                                              toItem: tipLabel,
                                              attribute: .right,
                                              multiplier: 1.0,
                                              constant: 0))
        addConstraint(NSLayoutConstraint.init(item: loginButton,
                                              attribute: .top,
                                              relatedBy: .equal,
                                              toItem: tipLabel,
                                              attribute: .bottom,
                                              multiplier: 1.0,
                                              constant: margin))
        addConstraint(NSLayoutConstraint.init(item: loginButton,
                                              attribute: .width,
                                              relatedBy: .equal,
                                              toItem: registerButton,
                                              attribute: .width,
                                              multiplier: 1.0,
                                              constant: 0))
    }
}
