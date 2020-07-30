//
//  HomeController.swift
//  SwiftDemo
//
//  Created by zhumuzhi on 2020/4/28.
//  Copyright © 2020 zhumuzhi. All rights reserved.
//

import UIKit

class HomeController: UIPageViewController {
    
    // MARK:- LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        configNavigationBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        InterfaceServer.getCateList()
    }
    
    
    func configNavigationBar() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "nav_search"), style: UIBarButtonItem.Style.plain, target: self, action: #selector(selectAction))
    }
    
    //MARK: - Event
    @objc private func selectAction() {
        navigationController?.pushViewController(UIViewController(), animated: true)
    }
    
    
    
}


