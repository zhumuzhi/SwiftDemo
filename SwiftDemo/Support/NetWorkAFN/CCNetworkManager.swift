//
//  CCNetworkManager.swift
//  SwiftDemo
//
//  Created by zhumuzhi on 2020/7/15.
//  Copyright © 2020 zhumuzhi. All rights reserved.
//

import UIKit
import AFNetworking

enum RequestMethod {
    case GET
    case POST
}

class CCNetworkManager: AFHTTPSessionManager {
    
    static let shared : CCNetworkManager = {
        let instance = CCNetworkManager()
        instance.requestSerializer = AFJSONRequestSerializer()
        instance.responseSerializer = AFJSONResponseSerializer()
        instance.requestSerializer.setValue("application/json,text/plain", forHTTPHeaderField: "Accccept")
        instance.requestSerializer.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        instance.responseSerializer.acceptableContentTypes?.insert("text/plain")
        return instance
    }()
    
    
    
    func request(method:RequestMethod, URLString:String, parameters:[String:AnyObject]?, completion:@escaping(_ isSuccess:Bool, _ json:Any?)->()) {
        
        let success = {
            (task: URLSessionDataTask, json: Any?) -> () in
            completion(true, json)
        }
        
        let failure = { (task: URLSessionDataTask?, error:Error) -> () in
            print("Request error ==> \(error)")
            if (task?.response as? HTTPURLResponse)?.statusCode == 403{
                print("token 过期了兄弟")
                //notification post message
//                NotificationCenter.default.post(name: Notification.Name(MNUserShouldLoginNotification) , object: "token403")
            }
            completion(false, nil)
        }
        
        if method == .GET{
            get(URLString, parameters: parameters, headers: nil, progress:nil, success:success, failure: failure)
            
        }else{
            post(URLString, parameters: parameters, headers: nil, progress: nil, success: success, failure: failure)
        }
    }
    
    
    
    
    
    
}
