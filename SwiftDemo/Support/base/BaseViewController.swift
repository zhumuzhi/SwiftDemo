//
//  BaseViewController.swift
//  SwiftDemo
//
//  Created by zhumuzhi on 2020/4/28.
//  Copyright © 2020 zhumuzhi. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    var t_barTintColor : UIColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.init(red: 231/255.0, green: 231/255.0, blue: 231/255.0, alpha: 1)
        
        if let ishide = self.navigationController?.navigationBar.isHidden {
            if ishide {
                let _topBg = UIView .init(frame: CGRect (x: 0, y: 0, width: kScreenWidth, height: 64))
                _topBg.backgroundColor = UIColor.white
                view.addSubview(_topBg)
                
                let backbtn = UIButton (frame: CGRect (x: 15, y: 27, width: 30, height: 30))
                backbtn.setImage(UIImage (named: "leftbackicon_sdk_login"), for: .normal)
                backbtn.imageEdgeInsets = UIEdgeInsets.init(top: 0, left: -10, bottom: 0, right: 10)
                
                _topBg.addSubview(backbtn)
                //backbtn.addTarget(self, action: #selector(navigationBackButtonAction), for: .touchUpInside)
            }
        }
        
    }
    
    //more_toolbar_press
    func addRightNavigationItem()  {
        let backbtn = UIButton (frame: CGRect (x: 0, y: 0, width: 40, height: 30))
        backbtn.setImage(UIImage (named: "more_toolbar_press"), for: .normal)
        backbtn.imageEdgeInsets = UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 0)
        backbtn.addTarget(self, action: #selector(_rightItemAction) , for: .touchUpInside)
        let leftitem = UIBarButtonItem.init(customView: backbtn)
        navigationItem.rightBarButtonItem = leftitem
    }
    
    /// 右侧item按钮事件
    @objc func _rightItemAction()  {
        
    }
    

    
}
