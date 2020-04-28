//
//  HomeController.swift
//  SwiftDemo
//
//  Created by zhumuzhi on 2020/4/28.
//  Copyright © 2020 zhumuzhi. All rights reserved.
//

import UIKit

class HomeController: UIViewController {
    
    // MARK:- Property
    
    

    // MARK:- LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = kRandomColor();
        
    }
    
    private lazy var sexTypeButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitleColor(UIColor.black, for: .normal)
        button.addTarget(self, action: #selector(changeSex), for: .touchUpInside)
        return button
    }()
    
    
//    private lazy var collectionView: UICollectionView  = {
//        let layout = UICollectionViewSecti
//
//    }
    
    
    
    
    // MARK:- Method
    
    @objc private func changeSex() {
        
    }
    
    

}
