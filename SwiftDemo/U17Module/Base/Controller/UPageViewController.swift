
//
//  UPageViewController.swift
//  SwiftDemo
//
//  Created by zhumuzhi on 2020/7/29.
//  Copyright © 2020 zhumuzhi. All rights reserved.
//

import HMSegmentedControl

enum UPageStyle {
    case none
    case navigationBarSegment
    case topTabBar
}


class UPageViewController: UIViewController {
    
    var pageStyle: UPageStyle!
    private(set) var viewControllers: [UIViewController]!
    private(set) var titles: [String]!
    private var currentSelectIndes: Int = 0
    
    lazy var segment: HMSegmentedControl = {
        let segment = HMSegmentedControl()
        segment.addTarget(self, action:#selector(changeIndex(segment:)), for: .valueChanged)
        return segment
    }()
    
    lazy var pageViewController: UIPageViewController = {
        return UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
    }()
    
    
    convenience init(titles: [String] = [], viewControllers:[UIViewController] = [], pageStyle: UPageStyle = .none) {
        self.init()
        self.titles = titles
        self.viewControllers = viewControllers
        self.pageStyle = pageStyle
    }
    
    
    //MARK: - Event
    @objc func changeIndex(segment: UISegmentedControl) {
        let index = segment.selectedSegmentIndex
           
    }
    
    
    
}
