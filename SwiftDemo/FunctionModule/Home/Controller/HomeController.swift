//
//  HomeController.swift
//  SwiftDemo
//
//  Created by zhumuzhi on 2020/4/28.
//  Copyright © 2020 zhumuzhi. All rights reserved.
//

import UIKit


class HomeController: UPageViewController {
    
    // MARK:- LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        InterfaceServerHome.getCateList(success: { (task, result) in
            
            
            print(result!)
            
        }) { (task, Error) in
            if Error != nil {
                print(Error!)
                return
            }
        }
        
    }
    
    
    override func configNaviagationBar() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "nav_search"),
                                                            style: UIBarButtonItem.Style.plain,
                                                            target: self,
                                                            action: #selector(selectAction))
    }
    
    //MARK: - Event
    @objc private func selectAction() {
//        navigationController?.pushViewController(URecommendController(), animated: true)
        navigationController?.pushViewController(listController(), animated: true)
        
    }
    
    
    
}


