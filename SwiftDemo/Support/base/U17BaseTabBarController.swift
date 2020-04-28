//
//  U17BaseTabBarController.swift
//  U17
//
//  Created by charles on 2017/9/29.
//  Copyright © 2017年 None. All rights reserved.

//  U17TabBar设置方式

import UIKit

class U17BaseTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.isTranslucent = false
        
        /// 首页
        let onePageVC = HomeController()
        addChildViewController(onePageVC,
                               title: "首页",
                               image: UIImage(named: "tabbar_home"),
                               selectedImage: UIImage(named: "tabbar_home_selected"))
        
        
        /// 分类
        let classVC = TopicController()
        addChildViewController(classVC,
                               title: "发现",
                               image: UIImage(named: "tabbar_discover"),
                               selectedImage: UIImage(named: "tabbar_discover_selected"))
        
        
        /// 书架
        let bookVC = LifeController()
        addChildViewController(bookVC,
                               title: "消息",
                               image: UIImage(named: "tabbar_message_center"),
                               selectedImage: UIImage(named: "tabbar_message_center_selected"))
        
        
        /// 我的
        let mineVC = MineController()
        addChildViewController(mineVC,
                               title: "我的",
                               image: UIImage(named: "tabbar_profile"),
                               selectedImage: UIImage(named: "tabbar_profile_selected"))
        
        
    }
    
    func addChildViewController(_ childController: UIViewController, title:String?, image:UIImage? ,selectedImage:UIImage?) {
        
        childController.title = title
        childController.tabBarItem = UITabBarItem(title: nil,
                                                  image: image?.withRenderingMode(.alwaysOriginal),
                                                  selectedImage: selectedImage?.withRenderingMode(.alwaysOriginal))
        
        if UIDevice.current.userInterfaceIdiom == .phone {
            childController.tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
        }
        addChild(UINavigationController(rootViewController: childController))
    }
    
}

extension U17BaseTabBarController {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        guard let select = selectedViewController else { return .lightContent }
        return select.preferredStatusBarStyle
    }
}
