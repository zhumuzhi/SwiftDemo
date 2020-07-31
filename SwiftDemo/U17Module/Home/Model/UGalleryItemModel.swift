//
//  UGalleryItemModel.swift
//  SwiftDemo
//
//  Created by zhumuzhi on 2020/7/31.
//  Copyright © 2020 zhumuzhi. All rights reserved.
//

import Foundation

class UGalleryItemModel: NSObject {

    var id:Int = 0
    var linkType:Int = 0
    var cover: String?
    var ext: [UExtModel]?
    var title: String?
    var content: String?
    
    init(dict: [String: String]) {
        super.init()
        setValuesForKeys(dict)
    }

    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
    
    override var description: String {
        return dictionaryWithValues(forKeys: ["id", "linkType", "cover", "ext", "title", "content"]).description
    }
    
}


