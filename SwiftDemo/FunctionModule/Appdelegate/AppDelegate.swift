//
//  AppDelegate.swift
//  SwiftDemo
//
//  Created by zhumuzhi on 2020/1/19.
//  Copyright © 2020 zhumuzhi. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UITabBarControllerDelegate {

    open var window : UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow.init(frame: UIScreen.main.bounds)
        window?.backgroundColor = UIColor.white
        
//        let tabBarController = BaseTabBarController()
//        tabBarController.delegate = self;
//        window?.rootViewController = tabBarController;
        
        let guideControler = GuideController()
        window?.rootViewController = guideControler;
        
        window?.makeKeyAndVisible()
        
        return true
    }
    
}

