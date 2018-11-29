//
//  UIBarButtonItem+Extension.swift
//  WeiBo
//
//  Created by apple on 2017/8/18.
//  Copyright © 2017年 Tools. All rights reserved.
//

import UIKit

extension UIBarButtonItem {
    
    
    convenience init(title:String, fontSize:CGFloat = 15, targrt:Any?, action:Selector ,isback:Bool) {
        
        let btn: UIButton = UIButton.cz_textButton(title, fontSize: fontSize, normalColor: UIColor.black, highlightedColor: UIColor.orange)
        
        if isback {
            
            btn.setImage(UIImage.init(named: "navigationbar_back_withtext"), for: UIControl.State.normal)
            btn.setImage(UIImage.init(named: "navigationbar_back_withtext_highlighted"), for: UIControl.State.highlighted)
            
            btn.sizeToFit()
        }
        
        btn.addTarget(targrt, action: action, for: .touchUpInside)

        self.init(customView: btn)
    

    }
    
    
  
}
