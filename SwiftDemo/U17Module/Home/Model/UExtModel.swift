//
//  UExtModel.swift
//  SwiftDemo
//
//  Created by zhumuzhi on 2020/7/31.
//  Copyright © 2020 zhumuzhi. All rights reserved.
//

import Foundation

class UExtModel: NSObject {
    var key: String?
    var val: String?
    
    init(dict: [String: String]) {
        super.init()
        setValuesForKeys(dict)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
    
    override var description: String {
        return dictionaryWithValues(forKeys: ["key", "val"]).description
    }
    
}
