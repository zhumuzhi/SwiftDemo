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
    
    class func getComicList () {
        
        let URL = "http://app.u17.com/v3/appV3_3/ios/phone" + "/list/commonComicList"
        
        let task = RequestBase.getRequest(url: URL, params: nil, tag: nil, retry: 0, progress: nil, success: { (task, result) in
            
            print("成功的task:\(String(describing: task))，请求的result:\(String(describing: result))")
        }) { (task, Error) in
            
            print("失败的task:\(String(describing: task))，请求的Error:\(String(describing: Error))")
        }
        NSLog("==%@", task)
    }
    
    
    
    
}



