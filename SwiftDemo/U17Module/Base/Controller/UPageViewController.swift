
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


class UPageViewController: UBaseViewController {
    
    var pageStyle: UPageStyle!
    private var currentSelectIndes: Int = 0
    private(set) var viewControllers: [UIViewController]!
    private(set) var titles: [String]!
        
    //MARK: - Event
    @objc func changeIndex(segment: UISegmentedControl) {
        let index = segment.selectedSegmentIndex
        if currentSelectIndes != index {
            let target:[UIViewController] = [viewControllers[index]]
            let direction:UIPageViewController.NavigationDirection = currentSelectIndes > index ? .reverse : .forward
            pageViewController.setViewControllers(target, direction: direction, animated: false) { [weak self] (finish) in
                self?.currentSelectIndes = index
            }
        }
    }
    
    //MARK: - Init
    convenience init(titles: [String] = [], viewControllers:[UIViewController] = [], pageStyle: UPageStyle = .none) {
        self.init()
        self.titles = titles
        self.viewControllers = viewControllers
        self.pageStyle = pageStyle
    }
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
    }
    
    override func configUI() {
        guard let viewController = viewControllers else {
            return
        }
        addChild(pageViewController)
        view.addSubview(pageViewController.view)
        
        pageViewController.dataSource = self
        pageViewController.delegate = self
        pageViewController.setViewControllers([viewController[0]], direction: .forward, animated: false, completion: nil)
        
        switch pageStyle {
        case .none:
            pageViewController.view.snp.makeConstraints{
                $0.edges.equalToSuperview()
            }
            
        case .navigationBarSegment?:
            segment.backgroundColor = UIColor.clear
            segment.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white.withAlphaComponent(0.5), NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20)]
            segment.selectionIndicatorLocation = .none
            navigationItem.titleView = segment
            segment.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width - 120, height: 40)
            pageViewController.view.snp.makeConstraints{
                $0.edges.equalToSuperview()
            }
            
        case .topTabBar:
            segment.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black,
                                           NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15)]
            segment.selectedTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(red: 127, green: 221, blue: 146, alpha: 1),
                                                   NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15)]
            segment.selectionIndicatorLocation = .down
            segment.selectionIndicatorColor = UIColor(red: 127, green: 221, blue: 146, alpha: 1)
            segment.selectionIndicatorHeight = 2
            segment.borderType = .bottom
            segment.borderColor = UIColor.lightGray
            segment.borderWidth = 0.5
            
            view.addSubview(segment)
            segment.snp.makeConstraints{
                $0.top.left.right.equalToSuperview()
                $0.height.equalTo(40)
            }
            
            pageViewController.view.snp.makeConstraints{
                $0.top.left.right.equalTo(segment.snp.bottom)
                $0.left.right.bottom.equalToSuperview()
            }
        default: break
        }
        
        guard let titles = titles else {
            return
        }
        segment.sectionTitles = titles
        currentSelectIndes = 0
        segment.selectedSegmentIndex = currentSelectIndes
    }
    
    //MARK: - Lazy
    lazy var segment: HMSegmentedControl = {
        let segment = HMSegmentedControl()
        segment.addTarget(self, action:#selector(changeIndex(segment:)), for: .valueChanged)
        return segment
    }()
    
    lazy var pageViewController: UIPageViewController = {
        return UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
    }()
    
}

//MARK: - UIPageViewControllerDataSource/Delegate Extension
    
extension UPageViewController: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = viewControllers.firstIndex(of: viewController) else {
            return nil
        }
        let beforeIndex = index - 1
        guard beforeIndex >= 0 else {
            return nil
        }
        return viewControllers[beforeIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = viewControllers.firstIndex(of: viewController) else {
            return nil
        }
        let afterIndex = index + 1
        guard afterIndex <= viewControllers.count - 1 else {
            return nil
        }
        return viewControllers[afterIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        
        guard let viewController = pageViewController.viewControllers?.last,
            let index = viewControllers.firstIndex(of: viewController) else {
                return
        }
        currentSelectIndes = index
        segment.setSelectedSegmentIndex(UInt(index), animated: true)
        guard titles != nil && pageStyle == UPageStyle.none else {
            return
        }
        navigationItem.title = titles[index]
        
    }
    
    
}
    
