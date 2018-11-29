//
//  Bundel+Extensions.swift
//  WeiBo
//
//  Created by apple on 2017/8/16.
//  Copyright © 2017年 Tools. All rights reserved.
//

import Foundation

extension Bundle {
    
    // 计算型属性类似于函数，没有参数，有返回值
    var namespace: String {
        return infoDictionary?["CFBundleName"] as? String ?? ""
    }

}

