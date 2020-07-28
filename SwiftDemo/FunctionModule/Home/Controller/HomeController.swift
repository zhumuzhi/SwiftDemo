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
        
        view.backgroundColor = kRandomColor()
        
        self.view.addSubview(collectionView)
        
        self .testAPI()
        
//        let URL = "[self .getBaseUrl()]" + "list/commonComicList"
//        RequestBase.getRequest(url: URL, param: nil, tag: "1", retry: 0, progress: nil, success: { (Obj) in
//            let dic = Obj
//            print("Obj%@", dic)
//        }) { (Error) in
//        }
        
    }
    
    // MARK:- ConfigUI
    
    
    // MARK:- LoadData
    
    func testAPI() {
        
        NetWorkRequest(.easyRequset, completion: { (returnData) in
            NSLog("returnData:\(returnData)")
        }) { (error) in
            NSLog("error:" + error)
        }
        
    }
    
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
//        let layout = UCollectionViewSectionBackgroundLayout()
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 5
        layout.minimumLineSpacing = 10

        let collectionView = UICollectionView(frame: CGRect(x:0, y:CGFloat(kSafeAreaTopHeight), width:kScreenWidth, height:kScreenHeight - CGFloat(kSafeAreaTopHeight) - CGFloat(kBottomAreaHeight)), collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.white
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.alwaysBounceVertical = true
//        collectionView.contentInset = UIEdgeInsets(top: kScreenWidth * 0.467, left: 0, bottom: 0, right: 0)
        collectionView.scrollIndicatorInsets = collectionView.contentInset
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier:"UICollectionViewCell")
        return collectionView
    }()
    
    // MARK:- UICollectionViewDataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        155
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "UICollectionViewCell", for: indexPath)
        cell.backgroundColor = UIColor.randomColor()
        return cell
    }
    
}


