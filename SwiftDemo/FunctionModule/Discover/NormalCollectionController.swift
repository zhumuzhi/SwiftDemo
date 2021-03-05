//
//  normalCollectionController.swift
//  SwiftDemo
//
//  Created by zhumuzhi on 2021/3/5.
//  Copyright © 2021 zhumuzhi. All rights reserved.
//

import UIKit

class NormalCollectionControler: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view .addSubview(collectionView)
    }
    
    //MARK: - UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "UICollectionViewCell", for: indexPath)
        cell.backgroundColor = UIColor.randomColor()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    
    //MARK: - Lazy
    private lazy var collectionView: UICollectionView  = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 5
        layout.minimumLineSpacing = 10
        
        let collectionView = UICollectionView(frame: CGRect(x:0, y:CGFloat(kSafeAreaTopHeight), width:kScreenWidth, height:kScreenHeight - CGFloat(kSafeAreaTopHeight) - CGFloat(kBottomAreaHeight)), collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.white
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.alwaysBounceVertical = true
        collectionView.scrollIndicatorInsets = collectionView.contentInset
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier:"UICollectionViewCell")
        return collectionView
    }()
    
}
