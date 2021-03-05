//
//  orderAuth.swift
//  SwiftDemo
//
//  Created by zhumuzhi on 2021/3/4.
//  Copyright © 2021 zhumuzhi. All rights reserved.
//

import Foundation

class OrderAuth: NSObject {
    
    
    /// 是否有申请取消按钮
    /// - Parameters:
    ///   - order_status:       订单状态
    ///   - hasBuyAuth:         下单权限
    ///   - cancle_apply_show:  是否显示取消字段
    public func hasApplyForCancelButton(order_status:Int, hasBuyAuth:Bool, cancle_apply_show:Bool) -> Bool {
        if (!hasBuyAuth) {
            return false
        }
        if (!self.isCancelButton(order_status: order_status)) {
            return true
        }
        return false
    }
    
    
    /// 是否展示取消按钮
    /// - Parameter order_status: 订单状态
    public func isCancelButton(order_status: Int) -> Bool {
        if (order_status == 9 || order_status == 10 || order_status == 20) {
            return true
        }
        return false
    }
    
    
}
