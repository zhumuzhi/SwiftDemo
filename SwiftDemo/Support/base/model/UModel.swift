//
//  UModel.swift
//  SwiftDemo
//
//  Created by zhumuzhi on 2020/7/2.
//  Copyright © 2020 zhumuzhi. All rights reserved.
//

import HandyJSON

extension Array: HandyJSON{}

struct ReturnData<T: HandyJSON>: HandyJSON {
    var message:String?
    var returnData: T?
    var stateCode: Int = 0
}

struct ResponseData<T: HandyJSON>: HandyJSON {
    var code: Int = 0
    var data: ReturnData<T>?
}
