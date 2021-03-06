//
//  API.swift
//  SwiftDemo
//
//  Created by zhumuzhi on 2020/7/3.
//  Copyright © 2020 zhumuzhi. All rights reserved.
//

import Foundation
import Moya


enum API {
    
    case register(email:String, password:String)
    case easyRequset
    case updateAPi(parameters:[String:Any])
    //上传用户头像
    case uploadHeadImage(parameters: [String:Any],imageDate:Data)
    
}

extension API: TargetType {
    
    var baseURL: URL {
        switch self {
        case .easyRequset:
            return URL.init(string:"http://news-at.zhihu.com/api")!
        default:
            return URL.init(string:(Moya_baseURL))!
        }
    }
    
    var path: String {
        switch self {
        case .register:
            return "/register"
        case .easyRequset:
            return "/4/news/latest"
        case .updateAPi:
            return "/versionService.getAppUpdateApi"
        case .uploadHeadImage:
            return "/file/user/upload.jhtml"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .easyRequset:
            return .get
        default:
            return .post
        }
    }
    
    var task: Task {
        //        return .requestParameters(parameters: nil, encoding: JSONArrayEncoding.default)
        switch self {
            
        case let .register(email, password):
            return .requestParameters(parameters: ["email": email, "password": password], encoding: JSONEncoding.default)
            
        case .easyRequset:
            return .requestPlain
            
        case let .updateAPi(parameters):
            return .requestParameters(parameters: parameters, encoding: URLEncoding.default)
            
        //图片上传
        case .uploadHeadImage(let parameters, let imageDate):
            ///name 和fileName 看后台怎么说，   mineType根据文件类型上百度查对应的mineType
            let formData = MultipartFormData(provider: .data(imageDate), name: "file",
                                             fileName: "hangge.png", mimeType: "image/png")
            return .uploadCompositeMultipart([formData], urlParameters: parameters)
        }
        //可选参数https://github.com/Moya/Moya/blob/master/docs_CN/Examples/OptionalParameters.md
        //        case .users(let limit):
        //        var params: [String: Any] = [:]
        //        params["limit"] = limit
        //        return .requestParameters(parameters: params, encoding: URLEncoding.default)
    }
    
    //    这个是做单元测试模拟的数据，必须要实现，只在单元测试文件中有作用
    var sampleData: Data {
        return "Moya-sampleData".data(using: String.Encoding.utf8)!
    }
    
    var headers: [String : String]? {
        return ["Content-Type":"application/x-www-form-urlencoded"]
    }
    
}

