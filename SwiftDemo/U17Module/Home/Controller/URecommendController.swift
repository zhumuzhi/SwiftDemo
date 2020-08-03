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
    private var comlicLists = [UComicListModel]()
    
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
        bannerView.lldidSelectItemAtIndex = didSelectBanner(index:)
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
        layout.minimumInteritemSpacing = 5
        layout.minimumLineSpacing = 10
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.background
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.alwaysBounceVertical = true
        collectionView.contentInset = UIEdgeInsets(top: kScreenWidth * 0.467, left: 0, bottom: 0, right: 0)
        collectionView.scrollIndicatorInsets = collectionView.contentInset
        collectionView.register(UComicItem.self , forCellWithReuseIdentifier: "UComicItemId")
        collectionView.register(UBoardItem.self , forCellWithReuseIdentifier: "UBoardItemId")
        
        return collectionView
    }()
    
    //MARK: - Event
    @objc func changeSex() {
        
    }
    
    private func didSelectBanner(index: NSInteger) {
        
    }
    
    //MARK: - RequestData
    private func loadData(_ changeSex:Bool) {
        InterfaceServerHome.getBoutiqueList(success: { (task, result) in
            print(result!)
        }) { (task, Error) in
            if Error != nil {
                print(Error!)
                return
            }
        }
    }
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadData(true)
        
    }
    
    override func configUI() {
        
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
        
        view.addSubview(bannerView)
        bannerView.snp.makeConstraints{
            $0.top.left.right.equalToSuperview()
            $0.height.equalTo(collectionView.contentInset.top)
        }
        
        view.addSubview(sexTypeButton)
        sexTypeButton.snp.makeConstraints{
            $0.width.height.equalTo(60)
            $0.bottom.equalToSuperview().offset(-20)
            $0.right.equalToSuperview()
        }
    }
 
}

extension URecommendController :UICollectionViewDataSource, UICollectionViewDelegate {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return comlicLists.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let comicList = comlicLists[section]
        return comicList.comics?.prefix(4).count ?? 0
    }
    
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let comicList = comlicLists[indexPath.section]
        if comicList.comicType == .billboard {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UBoardItemId", for: indexPath) as? UBoardItem
            cell?.dataModel = comicList.comics?[indexPath.row]
            return cell!
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UComicItemId", for: indexPath) as? UComicItem
        if comicList.comicType == .thematic {
            cell?.style = .none
        }else {
            cell?.style = .withTitleAndDesc
        }
        cell?.dataModel = comicList.comics?[indexPath.row]
        return cell!
    }
    
}
