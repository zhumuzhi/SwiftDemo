//
//  API.swift
//  SwiftDemo
//
//  Created by zhumuzhi on 2020/7/3.
//  Copyright © 2020 zhumuzhi. All rights reserved.
//

import Foundation

public struct API {
    var path: String
    var method: RequestMethod
    init(path: String, method: RequestMethod = .post) {
        self.path = path
        self.method = method
    }
}
