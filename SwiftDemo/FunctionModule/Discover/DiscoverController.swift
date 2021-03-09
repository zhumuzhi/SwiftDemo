//
//  DiscoverController.swift
//  SwiftDemo
//
//  Created by zhumuzhi on 2020/4/28.
//  Copyright © 2020 zhumuzhi. All rights reserved.
//  发现控制器

import UIKit

class DiscoverController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var dataArray = ["CollectionView", "案例2", "案例3", "案例4"]
    
    
    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white
        view.addSubview(tableView)
    }
    
    //MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCellId")
//        cell?.textLabel?.text = "Cell-\(indexPath.section)-\(indexPath.row)"
        cell?.textLabel?.text = dataArray[indexPath.row]
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        44.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        NSLog("选选中了第\(indexPath.section)-\(indexPath.row)")
        NSLog("选选中了:\(dataArray[indexPath.row])")
        
        if dataArray[indexPath.row] == "CollectionView" {
            self.navigationController?.hidesBarsOnTap = true
            self.navigationController?.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(GuideController(), animated: true)
        }
        
    }
    
    //MARK: - Lazy
    private lazy var tableView: UITableView = {
        let tableView = UITableView (frame: CGRect(x: 0, y: CGFloat(kSafeAreaTopHeight), width: kScreenWidth, height: kScreenHeight - CGFloat(kSafeAreaTopHeight) - CGFloat(kSafeAreaBottomHeight)), style: .plain)
        tableView.backgroundColor = UIColor.white
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCellId")
        tableView.tableFooterView = UIView()                            // 分割线显示至最后一个Cell
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none  // 隐藏分割线
        return tableView
    }()
    

}
