//
//  HomeController.swift
//  SwiftDemo
//
//  Created by zhumuzhi on 2020/4/28.
//  Copyright © 2020 zhumuzhi. All rights reserved.
//

import UIKit

class HomeController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    // MARK:- Property
    
    

    // MARK:- LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = kRandomColor();
        
    }
    
    // MARK:- ConfigUI
    
    
    
    
    
    // MARK:- Method
    
    @objc private func changeSex() {
        
    }
    
    
    // MARK:- LazyGet
    
    private lazy var sexTypeButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitleColor(UIColor.black, for: .normal)
        button.addTarget(self, action: #selector(changeSex), for: .touchUpInside)
        return button
    }()
    
    private lazy var collectionView: UICollectionView  = {
        let layout = UCollectionViewSectionBackgroundLayout()
        layout.minimumInteritemSpacing = 5
        layout.minimumLineSpacing = 10

        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.white
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.alwaysBounceVertical = true
        collectionView.contentInset = UIEdgeInsets(top: kScreenWidth * 0.467, left: 0, bottom: 0, right: 0)
        collectionView.scrollIndicatorInsets = collectionView.contentInset
        
        
        return collectionView
    }()
    
    
    
    
    
    
    
    
    // MARK:- UICollectionViewDataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "UICollectionViewCell", for: indexPath)
        return cell
    }
    
    
    
    
    

}
