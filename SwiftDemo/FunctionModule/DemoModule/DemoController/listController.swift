//
//  listController.swift
//  SwiftDemo
//
//  Created by zhumuzhi on 2020/8/4.
//  Copyright © 2020 zhumuzhi. All rights reserved.
//

import Foundation
import UIKit

class listController: UIViewController {
    
    var dataArray = ["Eggs", "Flour", "Chocolate chips"]
    var chooseDatas = [false, false, false]
    
    
    // MARK:- LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        self.navigationItem.title = "Flutter Demo"
        self.view.addSubview(self.tableView)
    }
    
    
    //MARK: - Lazy
    private lazy var tableView: UITableView = {
        let tableView = UITableView (frame: CGRect(x: 0, y: CGFloat(kSafeAreaTopHeight), width: kScreenWidth, height: kScreenHeight - CGFloat(kSafeAreaTopHeight) - CGFloat(kSafeAreaBottomHeight)), style: .plain)
        tableView.backgroundColor = UIColor.white
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(listCell.self, forCellReuseIdentifier: "listCellId")
        return tableView
    }()
    
}

//MARK: - UITableViewDataSource

extension listController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listCellId") as? listCell
        cell?.titleName = self.dataArray[indexPath.row]
        cell?.isChoose = self.chooseDatas[indexPath.row]
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        44.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var chooseValue = self.chooseDatas[indexPath.row]
        chooseValue = !chooseValue
        self.chooseDatas[indexPath.row] = chooseValue
        self.tableView.reloadData()
    }
    
}
    

