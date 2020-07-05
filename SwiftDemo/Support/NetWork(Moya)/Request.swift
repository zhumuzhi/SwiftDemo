//
//  Request.swift
//  SwiftDemo
//
//  Created by zhumuzhi on 2020/7/3.
//  Copyright © 2020 zhumuzhi. All rights reserved.
//

import Foundation

enum RequestMethod {
    case post
    case get
}

struct Request {
    init(method: RequestMethod = .post, baseURL: String = "", path: String, parameters: [String : Any]?) {
        self.method = method
        self.baseURL = baseURL
        self.path = path
        self.parameters = parameters ?? [:]
    }
    var method: RequestMethod
    var baseURL: String
    var path: String
    var parameters : [String: Any]
}
