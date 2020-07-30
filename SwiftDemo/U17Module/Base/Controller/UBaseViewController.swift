//
//  UBaseViewController.swift
//  SwiftDemo
//
//  Created by zhumuzhi on 2020/7/30.
//  Copyright © 2020 zhumuzhi. All rights reserved.
//

import UIKit

class UBaseViewController: UIViewController {
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.background
        
        if #available(iOS 11.0, *) {
            UIScrollView.appearance().contentInsetAdjustmentBehavior = .never
        } else {
            automaticallyAdjustsScrollViewInsets = false
        }
    }
        
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configNaviagationBar()
    }
    
    func configNaviagationBar() {
        guard let naviController = navigationController else {
            return
        }
        if naviController.visibleViewController == self {
            naviController.barStyle(.theme)
            naviController.disablePopGesture = false
            naviController.setNavigationBarHidden(false, animated: true)
            if naviController.viewControllers.count > 1 {
                navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "nav_back_white"), style: UIBarButtonItem.Style.plain,
                                                                   target: self,
                                                                   action: #selector(pressBack))
            }
        }
    }
    
    @objc func pressBack() {
        navigationController?.popViewController(animated: true)
    }
    
}

extension UBaseViewController {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
