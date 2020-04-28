//
//  DCTTBaseTabBarController.swift
//  SwiftDemo
//
//  Created by zhumuzhi on 2020/4/28.
//  Copyright © 2020 zhumuzhi. All rights reserved.

//  

import UIKit

class DCTTBaseTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        initTabbar()
    }
    
    func initTabbar() {
        
        tabBar.barTintColor = UIColor.white
        
        let itemTitleArray = [
            "首页",
            "生活",
            "占位",
            "话题",
            "个人"
        ]
        
        let itemIconArray:Array = [
            "tabbar_home",
            "tabbar_message_center",
            "tabbar_compose_icon_add" ,
            "tabbar_discover",
            "tabbar_profile"
        ]
        
        let itemIcon_selectedArray = [
            "tabbar_home_selected",
            "tabbar_message_center_selected",
            "tabbar_compose_icon_add_highlighted" ,
            "tabbar_discover_selected",
            "tabbar_profile_selected"
        ]
        
        let controllersName = [
            "HomeController",
            "LifeController",
            "BaseViewController",
            "TopicController",
            "MineController"]
        
        var viewControllerArray:Array = [UIViewController]()
        
        for i in 0..<controllersName.count {
            
            let appName = Bundle.main.infoDictionary!["CFBundleExecutable"] as!String
            let controllerClass = NSClassFromString(appName + "." + controllersName[i]) as!UIViewController.Type
            
            print("%@", controllerClass)
            
            var viewController:UIViewController!
            
            if i < controllersName.count  {
                viewController = controllerClass.init()
            }
            
            
            let barItem = UITabBarItem(title: itemTitleArray[i], image:UIImage (named: itemIconArray[i])?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: itemIcon_selectedArray[i])?.withRenderingMode(.alwaysOriginal))
            barItem.tag = i;
            
            if i == 2 {
                barItem.imageInsets = UIEdgeInsets.init(top: 5, left: 0, bottom: -5, right: 0)
            }
            
            // 设置选中颜色
            barItem.setTitleTextAttributes(convertToOptionalNSAttributedStringKeyDictionary([convertFromNSAttributedStringKey(NSAttributedString.Key.foregroundColor):UIColor.black]), for: .selected)
            
            viewController.tabBarItem = barItem;
            viewController.title = itemTitleArray[i];
            
            let navigationController = UINavigationController(rootViewController: viewController)
            
            viewControllerArray.append(navigationController)
            
//            addChild(navigationController)
            
        }
        
        viewControllers = viewControllerArray;
    }
    
    
    
}


// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertToOptionalNSAttributedStringKeyDictionary(_ input: [String: Any]?) -> [NSAttributedString.Key: Any]? {
    guard let input = input else { return nil }
    return Dictionary(uniqueKeysWithValues: input.map { key, value in (NSAttributedString.Key(rawValue: key), value)})
}

// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertFromNSAttributedStringKey(_ input: NSAttributedString.Key) -> String {
    return input.rawValue
}
