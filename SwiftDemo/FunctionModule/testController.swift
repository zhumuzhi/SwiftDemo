//
//  testController.swift
//  SwiftDemo
//
//  Created by zhumuzhi on 2020/7/21.
//  Copyright © 2020 zhumuzhi. All rights reserved.
//

import Foundation


class Item {
    var price : Double
    var name  : String
    init(price:Double, name:String) {
        self.price = price
        self.name = name
    }
}


class ShoppingCart {
    
    var name : String
    var code : String
    var DateTime : Date
    
//    var bookings : [Item]
//    func price() {
//        var sum : Double
//        for (var i in bookings) {
//            sum += i.price
//        }
//        return sum
//    }
    
    init(name:String, code:String) {
        self.name = name;
        self.code = code;
        self.DateTime = Date()
    }
    
    
    func getInfo() {
        print("购物车信息:\n----------------------------- \n用户名:%@ \n优惠码: \n日期: \n-----------------------------", self.name, self.code, self.DateTime)
    }
    
}




