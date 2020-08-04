//
//  InterfaceServer.swift
//  SwiftDemo
//
//  Created by zhumuzhi on 2020/7/21.
//  Copyright © 2020 zhumuzhi. All rights reserved.
//

import Foundation

let kUBaseURL = "http://app.u17.com/v3/appV3_3/ios/phone/"

class InterfaceServerHome: NSObject {
    
    var _commonComicListTask : URLSessionDataTask? = nil
    
    //MARK: - 获取分类列表
    class func getCateList (success:successBlock?, failure:failureBlock?) {
        let URL = kUBaseURL + "sort/mobileCateList"
        let task = RequestBase.getRequest(url: URL, params: nil, tag: nil, retry: 0, progress: nil, success: { (task, result) in
            success!(task, result)
        }) { (task, Error) in
            failure!(task, Error)
        }
        NSLog("CateList=task:%@", task)
    }
    
    //MARK: - 获取推荐列表
    class func getBoutiqueList(success:successBlock?, failure:failureBlock?)  {
        let URL = kUBaseURL + "comic/boutiqueListNew"
        var parmeters: [String : Any]  = [:]
        parmeters["sexType"] = "0"
        let task = RequestBase.getRequest(url: URL, params: parmeters, tag: nil, retry: 0, progress: nil, success: { (task, result) in
            success!(task, result)
        }) { (task, Error) in
            failure!(task, Error)
        }
        NSLog("BoutiqueList=task:%@", task)
    }
    
}



