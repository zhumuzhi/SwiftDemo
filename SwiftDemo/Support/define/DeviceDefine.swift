//
//  DeviceDefine.swift
//  SwiftDemo
//
//  Created by zhumuzhi on 2020/4/28.
//  Copyright © 2020 zhumuzhi. All rights reserved.
//

import Foundation
import UIKit
import WebKit

/// 屏幕宽度
public let kScreenWidth = UIScreen.main.bounds.width

/// 屏幕高度
public let kScreenHeight = UIScreen.main.bounds.height

/// 经过比例适配后的宽
public func kScaleWidth(_ w: CGFloat) -> CGFloat{
    return UIScreen.setWidth(width: w)
}

/// 经过比例适配后的高
public func kScaleH(_ h: CGFloat) -> CGFloat{
    return UIScreen.setHeight(height: h)
}

/// 是否是iPhone X
public let isIphoneX = isX()
fileprivate func isX() -> Bool {
    if #available(iOS 11.0, *) {
        return (UIApplication.shared.windows.first?.safeAreaInsets.bottom)! > 0
    } else {
        return false
    }
}

/// 顶部安全适配高度
public let kSafeAreaTopHeight = isIphoneX ? 88.0 : 64.0

/// 底部安全适配高度
public let kSafeAreaBottomHeight = isIphoneX ? 34.0 : 0.0

/// Navigantion栏高度
public let kNavigantionHeight = kSafeAreaTopHeight

/// NavigationBarHeigth
public let kNavigationBarHeight = 44.0

/// StatusBarHeight
public let kStatusBarHeight = isIphoneX ? 44.0 : 20.0

/// TabBarHeight
public let kTabBarHeight        = 49.0

// TabBarHeight+kSafeAreaBottomHeight
public let kBottomAreaHeight    =  kTabBarHeight + kSafeAreaBottomHeight
