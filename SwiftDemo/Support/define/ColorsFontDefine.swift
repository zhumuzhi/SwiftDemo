//
//  ColorsFontDefine.swift
//  SwiftDemo
//
//  Created by zhumuzhi on 2020/4/28.
//  Copyright © 2020 zhumuzhi. All rights reserved.
//

import UIKit


/// Hex颜色
/// - Parameter rgbValue: 0x333333
/// - Returns: UIColor
func UIColorFromHex(rgbValue: UInt) -> UIColor {
    return UIColor(
        red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
        green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
        blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
        alpha: CGFloat(1.0)
    )
}

/// 随机颜色
/// - Returns: UIColor
func kRandomColor() -> UIColor {
    return UIColor (red: CGFloat(arc4random_uniform(255))/255.0, green:  CGFloat(arc4random_uniform(255))/255.0, blue:  CGFloat(arc4random_uniform(255))/255.0, alpha: 1)
}

/// 通用背景色
/// - Returns: UIColor
func kCommonBackground() -> UIColor {
    return UIColor(red: 242, green: 242, blue: 242, alpha: 1)
}

/// 主题颜色
/// - Returns: UIColor
func kTheme() -> UIColor {
    return UIColor(red: 29, green: 221, blue: 43, alpha: 1)
}


/// 颜色转图片
/// - Parameter color: 颜色
/// - Returns: UIImage
func imageFromColor(color: UIColor) -> UIImage {
    let rect = CGRect(x: 0.0, y: 0.0, width: 1.0, height:1.0)
    UIGraphicsBeginImageContext(rect.size)
    let context = UIGraphicsGetCurrentContext()
    context!.setFillColor(color.cgColor)
    context!.fill(rect)
    let resultImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
    UIGraphicsEndImageContext()
    
    return resultImage
}


// 颜色Extension
extension UIColor { // 颜色

    /// 颜色
    ///
    /// - Parameters:
    ///   - red: 红色值(0 -- 255)
    ///   - blue: 蓝色值(0 -- 255)
    ///   - green: 绿色值(0 -- 255)
    ///   - alpha: 透明度(0 -- 1)
    static func rgba(red: CGFloat, blue: CGFloat, green: CGFloat, alpha: CGFloat = 1.0) -> UIColor {
        return UIColor.init(red: red / 255.0, green: green / 255.0, blue: blue / 255.0, alpha: alpha)
    }
    
    /// 随机颜色
    static func randomColor() -> UIColor {
        let red = CGFloat(arc4random_uniform(256))
        let green = CGFloat(arc4random_uniform(256))
        let blue = CGFloat(arc4random_uniform(256))
        return UIColor.rgba(red: red, blue: green, green: blue)
    }
    
    /// 16进制颜色
    ///
    /// - Parameter hex: 16进制颜色
    /// - Parameter alpha: 透明度
    static func hexColor(hex: String, alpha: CGFloat = 1.0) -> UIColor {
        var red:   CGFloat = 0.0
        var green: CGFloat = 0.0
        var blue:  CGFloat = 0.0
        var alpha: CGFloat = alpha
        var hex = hex
        
        if hex.hasPrefix("#") {
            let index = hex.index(hex.startIndex, offsetBy: 1)
            hex = String(hex[index...])
            
        }
        
        let scanner = Scanner(string: hex)
        var hexValue: CUnsignedLongLong = 0
        if scanner.scanHexInt64(&hexValue) {
            switch (hex.count) {
            case 3:
                red   = CGFloat((hexValue & 0xF00) >> 8)       / 15.0
                green = CGFloat((hexValue & 0x0F0) >> 4)       / 15.0
                blue  = CGFloat(hexValue & 0x00F)              / 15.0
            case 4:
                red   = CGFloat((hexValue & 0xF000) >> 12)     / 15.0
                green = CGFloat((hexValue & 0x0F00) >> 8)      / 15.0
                blue  = CGFloat((hexValue & 0x00F0) >> 4)      / 15.0
                alpha = CGFloat(hexValue & 0x000F)             / 15.0
            case 6:
                red   = CGFloat((hexValue & 0xFF0000) >> 16)   / 255.0
                green = CGFloat((hexValue & 0x00FF00) >> 8)    / 255.0
                blue  = CGFloat(hexValue & 0x0000FF)           / 255.0
            case 8:
                red   = CGFloat((hexValue & 0xFF000000) >> 24) / 255.0
                green = CGFloat((hexValue & 0x00FF0000) >> 16) / 255.0
                blue  = CGFloat((hexValue & 0x0000FF00) >> 8)  / 255.0
                alpha = CGFloat(hexValue & 0x000000FF)         / 255.0
            default:
                print("Invalid RGB string, number of characters after '#' should be either 3, 4, 6 or 8", terminator: "")
            }
        } else {
            print("Scan hex error")
        }
       return UIColor.init(red:red, green:green, blue:blue, alpha:alpha)
    }
}
