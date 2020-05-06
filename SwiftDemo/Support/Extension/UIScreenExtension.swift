//
//  UIScreenExtension.swift
//  SwiftDemo
//
//  Created by zhumuzhi on 2020/5/6.
//  Copyright © 2020 zhumuzhi. All rights reserved.
//

import Foundation
import UIKit

public extension UIScreen{
    
    /// 屏幕的size
    static var screenSize: CGSize {
        return UIScreen.main.bounds.size
    }
    
    /// 屏幕的宽
    static var screecWidth: CGFloat {
        return UIScreen.main.bounds.width
    }
    
    /// 屏幕的高
    static var screenHeight: CGFloat {
        return UIScreen.main.bounds.height
    }
    
    /// 适配后的宽(iPhone 6)
    class func setWidth(width: CGFloat) -> CGFloat{
        return (width / 375.0) * UIScreen.screecWidth
    }
    /// 适配后的高(iPhone 6)
    class func setHeight(height: CGFloat) -> CGFloat{
        return (height / 667.0) * (isIphoneX ? 667.0 : UIScreen.screenHeight)
    }
}
