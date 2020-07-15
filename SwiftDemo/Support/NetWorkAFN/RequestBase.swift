//
//  RequestBase.swift
//  SwiftDemo
//
//  Created by zhumuzhi on 2020/7/15.
//  Copyright © 2020 zhumuzhi. All rights reserved.
//

import UIKit
import AFNetworking

// 成功回调
typealias successBlock = (Any) -> Void
// 失败回调
typealias failureBlock = (Error) -> Void
// 进度回调
typealias progressBlock = (Progress) -> Void


enum RequestMethod {
    case GET
    case POST
}

class RequestBase: NSObject {
    
    // 请求队列
    static var netQueue: [String: URLSessionTask] = [String : URLSessionTask]()
    
    // 请求对象
    private static let manager = shared()
    
    //MARK: - 私有方法
    //MARK: 初始化
    
    private class func shared() -> AFHTTPSessionManager {
        
        let manager = AFHTTPSessionManager.init(baseURL: nil)
        
        manager.requestSerializer = AFJSONRequestSerializer()
        manager.responseSerializer = AFJSONResponseSerializer()
        
        // 超时设置
        manager.requestSerializer.timeoutInterval = 30
        
        // 证书设置
        manager.securityPolicy.allowInvalidCertificates = true
        manager.securityPolicy.validatesDomainName = false
        
        
        // 支持类型设置
        //        manager.requestSerializer.setValue("application/json,text/plain", forHTTPHeaderField: "Accccept")
        //        manager.requestSerializer.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        
        manager.responseSerializer.acceptableContentTypes = NSSet(objects:"application/json",
                                                                  "text/json",
                                                                  "text/javascript",
                                                                  "text/html",
                                                                  "text/plain",
                                                                  "multipart/form-data") as? Set<String>
        return manager
        
    }
    
    //MARK: - 公共方法
    
    //MARK: - Cancel
    /// 取消某个网络请求
    /// - Parameter key: 请求标记
    public class func cancelRequest(key: String?) {
        if let tag: String = key {
            if let task: URLSessionTask = netQueue[tag] {
                task.cancel()
            }
            netQueue.removeValue(forKey: tag)
        }
    }
    
    //MARK: GET
    /// Get请求
    /// - Parameters:
    ///   - url: URL地址
    ///   - param: 参数
    ///   - tag: 请求标记
    ///   - retry: 重试次数(0为不重复请求，只请求一次)
    ///   - progress: 进度回调
    ///   - success: 成功回调
    ///   - failure: 失败回调
    class func getRequest(url: String, param: Any?, tag: String?, retry: NSInteger, progress:progressBlock?, success: successBlock?, failure: failureBlock?) {
        
        // 成功 - 移除队列
        let task = manager.get(url, parameters: param, headers: nil, progress: progress, success: { (task, responseObj) in
         
            RequestBase.cancelRequest(key: tag)
            
            print("GET请求地址\n" + (task.response?.url?.absoluteString ?? "") + "\n")
            print(responseObj as Any)
            
            success?(responseObj as Any)
            
        }) { (task, error) in
        
            // 失败 - 移除队列
            RequestBase.cancelRequest(key: tag)
            if retry > 0 {
                self.getRequest(url: url, param: param, tag: tag, retry: (retry - 1), progress: progress, success: success, failure: failure)
            }else {
                failure?(error)
            }
        }

        if let key: String = tag {
            netQueue[key] = task
        }
        
    }
    
    //MARK: POST
       /// POST请求
       ///
       /// - Parameters:
       ///   - url: 地址
       ///   - param: 参数
       ///   - tag: 请求标记
       ///   - retry: 重试次数（0为不进行重试请求，只请求一次）
       ///   - progress: 进度回调
       ///   - success: 成功回调
       ///   - failure: 失败回调
       class func postRequest(url: String, param: Any, tag: String?, retry: NSInteger, progress: progressBlock?, success: successBlock?, failure: failureBlock?){
           
        let task = manager.post(url, parameters: param, headers: nil, progress: progress, success: { (task, responseObj) in
               //成功
               //移除队列
               RequestBase.cancelRequest(key: tag)
               
               print( ("POST请求地址\n" + (task.response?.url?.absoluteString ?? "") + "\n"))
               print( responseObj as Any)

               success?(responseObj as Any)
               
           }) { (task, error) in
               
               //移除队列
               RequestBase.cancelRequest(key: tag)
               
               if retry > 0 {
                   self.postRequest(url: url, param: param,tag: tag, retry: (retry - 1), progress: progress, success: success, failure: failure)
               }else{
                   failure?(error)
               }
           }
           
           task?.resume()
           
           if let key: String = tag {
               netQueue[key] = task
           }
       }
    
    //MARK: POST文件上传
    /// POST文件上传
    ///
    /// - Parameters:
    ///   - url: 网址
    ///   - param: 参数
    ///   - file: 文件地址
    ///   - tag: 请求标记
    ///   - retry: 重试次数（0为不进行重试请求，只请求一次）
    ///   - progress: 进度回调
    ///   - success: 成功回调
    ///   - failure: 失败回调
    class func uploadFileRequest(url: String, param: Any, file: String, tag: String?, retry: NSInteger, progress: progressBlock?, success: successBlock?, failure: failureBlock?){
        
        let task = manager.post(url, parameters: param, constructingBodyWith: { (formData) in
            //获取data
            if let data = NSData(contentsOfFile: file) {
                //进行上传
                formData.appendPart(withFileData: data as Data, name: "filename", fileName: (file as NSString).lastPathComponent, mimeType: "application/octet-stream")
            }
        }, progress: progress, success: { (task, responseObj) in
            //成功
            //移除队列
            RequestBase.cancelRequest(key: tag)
            
            success?(responseObj as Any)
        }) { (task, error) in
            //失败
            //移除队列
            RequestBase.cancelRequest(key: tag)
            
            if retry > 0 {
                self.uploadFileRequest(url: url, param: param, file: file, tag: tag, retry: (retry - 1), progress: progress, success: success, failure: failure)
            }else{
                failure!(error)
            }
        }
        
        if let key: String = tag {
            netQueue[key] = task
        }
    }
    
    //MARK: POST文件批量上传
    /// POST文件批量上传
    ///
    /// - Parameters:
    ///   - url: 网址
    ///   - param: 参数
    ///   - files: 文件集合(本地路径)
    ///   - tag: 请求标记
    ///   - retry: 重试次数（0为不进行重试请求，只请求一次）
    ///   - progress: 进度回调
    ///   - success: 成功回调
    ///   - failure: 失败回调
    public class func uploadFilesRequest(url: String, param: Any, files: [String], tag: String?, retry: NSInteger, progress: progressBlock?, success: successBlock?, failure: failureBlock?){
        let task = manager.post(url, parameters: param, constructingBodyWith: { (formData) in
            
            for file in files {
                //获取data
                if let data = NSData(contentsOfFile: file) {
                    //进行上传
                    formData.appendPart(withFileData: data as Data, name: "filename", fileName: (file as NSString).lastPathComponent, mimeType: "application/octet-stream")
                }
            }
        }, progress: progress, success: { (task, responseObj) in
            //成功
            //移除队列
            RequestBase.cancelRequest(key: tag)

            success?(responseObj as Any)
        }) { (task, error) in
            //失败
            //移除队列
            RequestBase.cancelRequest(key: tag)
            
            if retry > 0 {
                self.uploadFilesRequest(url: url, param: param, files: files, tag: tag, retry: (retry - 1), progress: progress, success: success, failure: failure)
            }else{
                failure!(error)
            }
        }
        
        if let key: String = tag {
            netQueue[key] = task
        }
    }
    
    
}
