//
//  InterfaceServer.swift
//  SwiftDemo
//
//  Created by zhumuzhi on 2020/7/21.
//  Copyright © 2020 zhumuzhi. All rights reserved.
//

import Foundation



class InterfaceServer: NSObject {
    
    var _commonComicListTask : URLSessionDataTask? = nil
    
    //MARK: - BaseURL
    func getBaseUrl() -> String {
        return "http://app.u17.com/v3/appV3_3/ios/phone"
    }
    
    //MARK: - 获取分类列表
    class func getCateList () {
        let URL = "http://app.u17.com/v3/appV3_3/ios/phone" + "/sort/mobileCateList"
        let task = RequestBase.getRequest(url: URL, params: nil, tag: nil, retry: 0, progress: nil, success: { (task, result) in
            print(result!)
        }) { (task, Error) in
            if Error != nil {
                print(Error!)
                return
            }
        }
        NSLog("==%@", task)
    }
    
    
    
    
}



