//
//  ColorsFontDefine.swift
//  SwiftDemo
//
//  Created by zhumuzhi on 2020/4/28.
//  Copyright © 2020 zhumuzhi. All rights reserved.
//

import UIKit

func UIColorFromHex(rgbValue: UInt) -> UIColor {
    return UIColor(
        red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
        green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
        blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
        alpha: CGFloat(1.0)
    )
}

func kRandomColor() -> UIColor {
    return UIColor (red: CGFloat(arc4random_uniform(255))/255.0, green:  CGFloat(arc4random_uniform(255))/255.0, blue:  CGFloat(arc4random_uniform(255))/255.0, alpha: 1)
}
