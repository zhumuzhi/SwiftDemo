//
//  UComicListModel.swift
//  SwiftDemo
//
//  Created by zhumuzhi on 2020/7/31.
//  Copyright © 2020 zhumuzhi. All rights reserved.
//

import Foundation

class UComicListModel: NSObject {
    var comicType: UComicType = .none
    var canedit: Bool = false
    var sortId: Int = 0
    var titleIconUrl: String?
    var newTitleIconUrl: String?
    var descriptions: String?
    var itemTitle: String?
    var argCon: Int = 0
    var argName: String?
    var argValue: Int = 0
    var argType: Int = 0
    var comics:[ComicModel]?
    var maxSize: Int = 0
    var canMore: Bool = false
    var hasMore: Bool = false
    var spinnerList: [SpinnerModel]?
    var defaultParameters: DefaultParametersModel?
    var page: Int = 0
    
    init(dict: [String: String]) {
        super.init()
        setValuesForKeys(dict)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
    
    override var description: String {
        return dictionaryWithValues(forKeys: []).description
    }
    
}
