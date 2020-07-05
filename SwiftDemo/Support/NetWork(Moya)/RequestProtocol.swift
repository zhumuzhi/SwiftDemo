//
//  RequestProtocol.swift
//  SwiftDemo
//
//  Created by zhumuzhi on 2020/7/3.
//  Copyright © 2020 zhumuzhi. All rights reserved.
//

import Foundation
import HandyJSON

public protocol RequestProtocol: HandyJSON {
    static func request(api: API, params: [String: Any]?, result: ((ResponseResult<Self>)->())?)
}

public extension RequestProtocol where Self: HandyJSON {
    static func request(api: API, params: [String: Any?], result: ((ResponseResult<Self>)->())?) {
        let completionHandle: ((Result<Data, Error>)->()) = { res in
//            switch res {
//            case .success(let data):
//
//            case .failure(_):
            }
            
            
        }
        
//        if api.method == .post {
//            NetworkManager.
//        }
        
}
