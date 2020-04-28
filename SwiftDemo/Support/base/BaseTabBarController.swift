//
//  BaseTabBarController.swift
//  SwiftDemo
//
//  Created by zhumuzhi on 2020/4/28.
//  Copyright © 2020 zhumuzhi. All rights reserved.
//

import UIKit

class BaseTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    func initTabbar() {
        
        tabBar.barTintColor = UIColor.white
        
        let itemTitleArray = [
            "首页",
            "话题",
            "占位",
            "生活",
            "个人"
        ]
        
        let itemIcon_normalArray:Array = [
            "tabbar_icon_home",
            "tabbar_icon_friend",
            "tabbar_icon_publish" ,
            "tabbar_icon_all",
            "tabbar_icon_me"
        ]
        
        let itemIcon_selectedArray = [
            "tabbar_icon_home_selected",
            "tabbar_icon_friend_selected",
            "tabbar_icon_publish" ,
            "tabbar_icon_all_selected",
            "tabbar_icon_me_selected"
        ]
        
        let controllers = [
                "HomeController",
                "TopicController",
                "BaseViewController",
                "LifeController",
                "MineViewController"]
        
        var viewControllers : Array = [UIViewController]()
        
        for i in 0..<controllers.count {
            
            let appName = Bundle.main.infoDictionary!["CFBundleExecutable"] as!String
//            let class = NSClassFromString(appName + "." + controllers[i]) as!
            
            
            
        }
        
        
        
    }
    
    

}
