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
        
        tabBar.isTranslucent = false
        
        /// 首页
        let onePageVC = HomeController()
        addChildViewController(onePageVC,
                               title: "首页",
                               image: UIImage(named: "tabbar_home"),
                               selectedImage: UIImage(named: "tabbar_home_selected"))
        
        /// 消息
        let topicVC = TopicController()
        addChildViewController(topicVC,
                               title: "消息",
                               image: UIImage(named: "tabbar_message_center"),
                               selectedImage: UIImage(named: "tabbar_message_center_selected"))
        
        /// 发现
        let lifeVC = LifeController()
        addChildViewController(lifeVC,
                               title: "发现",
                               image: UIImage(named: "tabbar_discover"),
                               selectedImage: UIImage(named: "tabbar_discover_selected"))
                
        /// 我的
        let mineVC = MineController()
        addChildViewController(mineVC,
                               title: "我的",
                               image: UIImage(named: "tabbar_profile"),
                               selectedImage: UIImage(named: "tabbar_profile_selected"))
        
        
    }
    
    func addChildViewController(_ childController: UIViewController, title:String?, image:UIImage? ,selectedImage:UIImage?) {
        
        childController.title = title
        childController.tabBarItem = UITabBarItem(title: title,
                                                  image: image?.withRenderingMode(.alwaysOriginal),
                                                  selectedImage: selectedImage?.withRenderingMode(.alwaysOriginal))
        
//        if UIDevice.current.userInterfaceIdiom == .phone {
//            childController.tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
//        }
        
        addChild(UINavigationController(rootViewController: childController))
    }
    
}
