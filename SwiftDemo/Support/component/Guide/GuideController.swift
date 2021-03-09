//
//  normalCollectionController.swift
//  SwiftDemo
//
//  Created by zhumuzhi on 2021/3/5.
//  Copyright © 2021 zhumuzhi. All rights reserved.
//

import UIKit

class GuideController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var dataArray : [String] = [String]()
    var start: UIButton = UIButton()
    var skip: UIButton = UIButton()
    var pageControl: UIPageControl = UIPageControl()
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataArray = ["guide1", "guide2", "guide3", "guide4"]
        
        self.configUI()
    }
    
    func configUI() {
        self.view.addSubview(collectionView)
        
        skip = UIButton.init(frame: CGRect(x: (kScreenWidth-44-30), y: 60, width: 64, height: 44))
        skip.setTitle("跳过", for: UIControl.State.normal)
        skip.setTitleColor(UIColor.white, for: UIControl.State.normal)
        skip.layer.cornerRadius = 22
        skip.layer.borderWidth = 1
        skip.layer.borderColor = UIColor.white.cgColor
        skip.addTarget(self, action: #selector(skipEvent), for: UIControl.Event.touchUpInside)
        self.view.addSubview(self.skip)
        
        pageControl = UIPageControl.init(frame: CGRect(x: 0, y: CGFloat(kScreenHeight)-CGFloat(kSafeAreaBottomHeight)-170, width: kScreenWidth, height: 25))
        pageControl.numberOfPages = dataArray.count
        pageControl.currentPage = 0
        pageControl.currentPageIndicatorTintColor = UIColor.orange
        self.view.addSubview(pageControl)
        
        start = UIButton.init(frame: CGRect(x: (kScreenWidth-120)*0.5, y: pageControl.frame.maxY + 20, width: 120, height: 44))
        start.setTitle("立即体验", for: UIControl.State.normal)
        start.setTitleColor(UIColor.orange, for: UIControl.State.normal)
        start.layer.cornerRadius = 22
        start.layer.borderWidth = 1
        start.layer.borderColor = UIColor.white.cgColor
        start.isHidden = true
        start.addTarget(self, action: #selector(startEvent), for: UIControl.Event.touchUpInside)
        self.view.addSubview(self.start)
        
    }
    
    //MARK: - Event
    @objc func startEvent (){
        print("点击了【立即体验】按钮")
    }
    
    @objc func skipEvent() {
        print("skipEvent")
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offset = scrollView.contentOffset
        pageControl.currentPage = Int(round(offset.x / kScreenWidth))
        
        if (pageControl.currentPage == dataArray.count-1) {
            start.isHidden = false
        }else {
            start.isHidden = true
        }
    }
    
    //MARK: - UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        dataArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:GuideCell = collectionView.dequeueReusableCell(withReuseIdentifier: "GuideCell", for: indexPath) as! GuideCell
        cell.contentView.backgroundColor = UIColor.randomColor()
        cell.imageView.image = UIImage.init(named: dataArray[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("点击了\(indexPath.section)-\(indexPath.row)")
    }
    
    //MARK: - Lazy
    private lazy var collectionView: UICollectionView  = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: kScreenWidth, height: kScreenHeight)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: CGRect(x:0, y:0, width:kScreenWidth, height:kScreenHeight), collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.backgroundColor = UIColor.white
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isPagingEnabled = true
        collectionView.register(GuideCell.self, forCellWithReuseIdentifier:"GuideCell")
        return collectionView
    }()
    
}
