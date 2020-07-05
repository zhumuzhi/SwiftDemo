//
//  U17API.swift
//  SwiftDemo
//
//  Created by zhumuzhi on 2020/5/6.
//  Copyright © 2020 zhumuzhi. All rights reserved.
//

import Moya
import HandyJSON


enum UApi {
//    case searchHot  //搜索热门
    case searchRelative(inputText: String)//相关搜索
    case searchResult(argCon: Int, q: String)//搜索结果
}


extension UApi: TargetType {
    
    var baseURL: URL {
        return URL(string: "http://app.u17.com/v3/appV3_3/ios/phone")!
    }
    
    var path: String {
        switch self {
        case .searchRelative: return "search/relative"
        case .searchResult: return "search/searchResult"
        }
    }

    var method: Moya.Method {
        return .get
    }
    
    var task: Task {
        var parmeters: [String : Any] = [:]
        switch self {
        case .searchRelative(let inputText):
            parmeters["inputText"] = inputText
        case .searchResult(let argCon, let q):
            parmeters["argCon"] = argCon
            parmeters["q"] = q
            
        default: break
        }
        return .requestParameters(parameters: parmeters, encoding: URLEncoding.default)
    }
    
    var sampleData: Data {
        return "".data(using: String.Encoding.utf8)!
    }
    
    var headers: [String : String]? {
        return nil
    }
    
}

let ApiProvider = MoyaProvider<UApi>()

let ApiLoadingProvider = MoyaProvider<UApi>()

extension Response {
    func mapModel<T: HandyJSON>(_ type: T.Type) throws -> T {
        let jsonString = String(data: data, encoding: .utf8)
        guard let model = JSONDeserializer<T>.deserializeFrom(json: jsonString) else {
            throw MoyaError.jsonMapping(self)
        }
        return model
    }
}

extension MoyaProvider {
    @discardableResult
    open func request<T: HandyJSON>(_ target: Target,
                                    model: T.Type,
                                    completion: ((_ returnData: T?) -> Void)?) -> Cancellable? {
        
        return request(target, completion: { (result) in
            guard let completion = completion else { return }
//            guard let returnData = result.mapModel(ResponseData<T>.self) else {
//            guard let returnData = try? result.value?.mapModel(ResponseData<T>.self) else {
//                completion(nil)
//                return
//            }
//            completion(returnData.data?.returnData)
        })
    }
}
