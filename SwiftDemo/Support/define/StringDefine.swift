//
//  StringDefine.swift
//  SwiftDemo
//
//  Created by zhumuzhi on 2020/5/6.
//  Copyright © 2020 zhumuzhi. All rights reserved.
//

import Foundation
import UIKit

/// Debug输出
public func print<T>(message: T, file: String = #file, line: Int = #line, method: String = #function) {
    #if DEBUG
    print("\((file as NSString).lastPathComponent)文件第\(line)行,log: \n\(message)")
    #endif
}

// MARK:- String

// MARK:String -> base64
public func base64EncodeString(string: String) -> String {
    let data = string.data(using: String.Encoding.utf8)
    let resultString = data?.base64EncodedString(options: Data.Base64EncodingOptions(rawValue: UInt(0)))
    
    return resultString!
}

// MARK:base64 -> String
public func base64DecodeString(string: String) -> String {
    let data = NSData(base64Encoded:string, options:NSData.Base64DecodingOptions(rawValue: 0))
    let resultString = String(data: data! as Data, encoding: String.Encoding(rawValue: String.Encoding.utf8.rawValue))
    
    return resultString!
}

// MARK:json -> String
public func jsonToString(any: Any) -> String {
    let data = try?JSONSerialization.data(withJSONObject: any, options: .prettyPrinted)
    let json = String.init(data: data!, encoding: String.Encoding(rawValue: String.Encoding.utf8.rawValue))
    
    return json ??  ""
}

// MARK:image -> String
//public func imageToString(image: UIImage) -> String {
//    var data = UIImageJPEGRepresentation(image, 1.0)
//    let scale: Float = Float(180 / (Float((data?.count)! / 1024)))
//    data = UIImageJPEGRepresentation(image, scale < 1 ? CGFloat(scale) : 1)
//    let image_string = data?.base64EncodedString(options: .lineLength64Characters)
//    return image_string
//}



// MARK:- System Operation

/// 打电话
/// - Parameter numString: 电话号码
//public func callToNum(numString: String) {
//    let telNumber = "tel:" + numString
//    let callWebView = WKWebView()
//    callWebView.load(URLRequest.init(url: URL.init(string: telNumber)!))
//    UIApplication.shared.keyWindow?.addSubview(callWebView)
//}


/// 获取App版本号
public func appVersion() -> String {
    return Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String
}

/// 获取Build Id
public func appBuild() -> String {
    return Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") as! String
}

// 在方法的func关键字之前加上关键字static或者class都可以用于指定类方法,不同的是用class关键字指定的类方法可以被子类重写,但是用static关键字指定的类方法是不能被子类重写的,可以指定static的类方法包含final关键字的特性--防止被重写.

/// 获取UUID
public func appUUID() -> String {
    return (UIDevice.current.identifierForVendor?.uuidString)!
}

/// 获取系统版本号
public func iOSVersion() -> String {
    return UIDevice.current.systemVersion
}

// MARK:- 偏好设置

// MARK: 保存
public func userDefaultSaveKey(key: String, value: String?) -> Void {
    return UserDefaults.standard.setValue(value, forKey: key)
}

// MARK: 读取
public func userDefaultReadKey(key: String) -> String? {
    return UserDefaults.standard.object(forKey: key) as? String
}

// MARK: 保存 - 数组
public func userDefaultSaveArray(key: String, value: Array<Any>) -> Void {
    return UserDefaults.standard.set(value, forKey: key)
}

// MARK: 读取 - 数组
public func userDefaultReadArray(key: String) -> Array<Any> {
    return (UserDefaults.standard.object(forKey: key) as? Array) ?? []
}




















// MARK:- 预留String

/// 邮箱匹配
let mail: String = "^([a-z0-9_\\.-]+)@([\\da-z\\.-]+)\\.([a-z\\.]{2,6})$"

/// 匹配用户名 字面或者数字组合 4到16位
let Username: String = "^[a-z0-9_-]{4,16}$"

/// 匹配密码 字面加下划线，6到18位
let Password: String = "^[a-z0-9_-]{6,18}$"

/// 匹配16进制
let HexValue: String = "^#?([a-f0-9]{6}|[a-f0-9]{3})$"

///内容带分割符号 “Anne-Blair”
let Slug: String = "^[a-z0-9-]+$"

/// 匹配URL
let isURL: String = "^(https?:\\/\\/)?([\\da-z\\.-]+)\\.([a-z\\.]{2,6})([\\/\\w \\.-]*)*\\/?$"

/// 匹配IP地址
let IPAddress: String = "^(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$"

/// 是HTML <center>内容<\center>  符合
let HTMLTag: String = "^<([a-z]+)([^<]+)*(?:>(.*)<\\/\\1>|\\s+\\/>)$"

/// 日期(年-月-日)
let isDate1: String = "(\\d{4}|\\d{2})-((1[0-2])|(0?[1-9]))-(([12][0-9])|(3[01])|(0?[1-9]))"

/// 日期(月/日/年)
let isDate2: String = "((1[0-2])|(0?[1-9]))/(([12][0-9])|(3[01])|(0?[1-9]))/(\\d{4}|\\d{2})"

/// 时间(小时:分钟, 24小时制)
let TimeFormat: String = "((1|0?)[0-9]|2[0-3]):([0-5][0-9])"

/// 是汉字
let isChinese: String = "[\\u4e00-\\u9fa5]"

/// 中文及全角标点符号(字符)
let ChineseParagraph: String = "[\\u3000-\\u301e\\ufe10-\\ufe19\\ufe30-\\ufe44\\ufe50-\\ufe6b\\uff01-\\uffee]"

/// 中国大陆固定电话号码
let fixedLineTelephone: String = "(\\d{4}-|\\d{3}-)?(\\d{8}|\\d{7})"

/// 中国大陆身份证号(15位或18位)
let IdNum: String = "\\d{15}(\\d\\d[0-9xX])?"

/// 手机号
let isIphoneNum: String = "1\\d{10}"

/// 邮政编码
let zipCode: String = "[1-9]\\d{5}"
