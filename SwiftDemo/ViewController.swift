//
//  ViewController.swift
//  SwiftDemo
//
//  Created by zhumuzhi on 2020/1/19.
//  Copyright © 2020 zhumuzhi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let a = 10
        if a>9 {
            print(a)
        }
        
        let isCan : Bool = isCanOnline(age: 22)
        print(isCan)
        
    }
    
    
    func isCanOnline(age:Int) -> Bool {
        
        guard age>=18 else {
            print("不能上网")
            return false
        }
        
        print("可以上网")
        return true
        
    }
    

}

