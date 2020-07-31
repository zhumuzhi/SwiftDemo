//
//  URecommendController.swift
//  SwiftDemo
//
//  Created by zhumuzhi on 2020/7/31.
//  Copyright © 2020 zhumuzhi. All rights reserved.
//  首页-推荐控制器

import UIKit
import LLCycleScrollView


class URecommendController: UBaseViewController {
    
    private var sexType: Int = UserDefaults.standard.integer(forKey: String.sexTypeKey)
    private var galleryItems = [UGalleryItemModel]()
    private var TextItems = [UTextItemModel]()
    private var comlicLists = [ComicListModel]()
    
    //MARK: - Lazy
    private lazy var bannerView: LLCycleScrollView = {
        let bannerView = LLCycleScrollView()
        bannerView.backgroundColor = UIColor.background
        bannerView.autoScrollTimeInterval = 6
        bannerView.placeHolderImage = UIImage(named: "")
        bannerView.coverImage = UIImage()
        bannerView.pageControlPosition = .right
        bannerView.pageControlBottom = 20
        bannerView.titleBackgroundColor = UIColor.clear
//        bannerView.lldidSelectItemAtIndex = didSelectBanner(index:)
        return bannerView
    }()
    
    private lazy var sexTypeButton: UIButton = {
        let sexType = UIButton(type: .custom)
        sexType.setTitleColor(UIColor.black, for: .normal)
        sexType.setTitleColor(UIColor.black, for: .normal)
        sexType.addTarget(self, action:#selector(changeSex), for: .touchUpInside)
        return sexType
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UCollectionViewSectionBackgroundLayout()
        
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        return collectionView
    }()
    
    //MARK: - Event
    @objc func changeSex() {
        
    }
    
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
 
    
}
