//
//  TopicController.swift
//  SwiftDemo
//
//  Created by zhumuzhi on 2020/4/28.
//  Copyright © 2020 zhumuzhi. All rights reserved.
//

import UIKit
import Foundation

class TopicController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var dataArray = [String]()
    
    //MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white;
        self.navigationItem.title = "列表测试"
        
        let button: UIButton = UIButton(type: .infoDark)
        button.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        button.addTarget(self, action:#selector(self.clickedButton), for: .touchUpInside)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(customView: button)
        
        self.view .addSubview(self.tableView)
        addDatas()
    }
    
    @objc func clickedButton()->() {
        let tempController = UIViewController()
        tempController.view.backgroundColor = kRandomColor()
        tempController.navigationItem.title = "收藏控制器"
        self.navigationController? .pushViewController(tempController, animated: true)
    }
    
    //MARK: - 添加数据
    func addDatas() -> () {
        for _ in 0..<20 {
            var num = Int(arc4random() % 10)
            if num < 4 {num = 4}
            let title = getRandomString(num, false, true, true)
            dataArray.append(title)
        }
        self.tableView .reloadData()
    }
    
    //MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCellId")
        let title = dataArray[indexPath.row]
        if indexPath.row == self.dataArray.count-10 {
            addDatas()
        }
        cell?.textLabel?.text = title
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        44.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        NSLog("选选中了第\(indexPath.section)-\(indexPath.row)")
    }
    
    //MARK: - LazyGet
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView (frame: CGRect(x: 0, y: CGFloat(kSafeAreaTopHeight), width: kScreenWidth, height: kScreenHeight - CGFloat(kSafeAreaTopHeight) - CGFloat(kBottomAreaHeight)), style: .plain)
        tableView.backgroundColor = UIColor.white
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCellId")
        return tableView
    }()
    
}


/** 随机产生字符串
    parameters:
    - number 字符串长度
    - digital 是否包含数字
    - capital 是否包含大写
    - lowercase 是否包含小写
 */
func getRandomString(_ number:Int! ,_ digital:Bool!,_ capital:Bool!,_ lowercase:Bool!) -> String{
    var number:Int! = number
    if number < 1 {
        number = 32
    }
    
    var strArray:Array<String> = Array()
    for _ in 0...INT64_MAX {
        let a:Int = Int(arc4random() % 122)
        let c:Character = Character(UnicodeScalar(a)!)
        //包含数字
        if digital {
            if a > 47 && a < 58{
                 strArray.append(String.init(c))
            }
        }
        //大写字母
        if capital {
            if a > 64 && a < 92 {
                strArray.append(String.init(c))
            }
        }
        //小写字母
        if lowercase {
            if a > 96 && a < 123 {
                strArray.append(String.init(c))
            }
        }
        if strArray.count == number{
            break
        }
    }
    let str:String = strArray.joined(separator: "")
    return str;
}

