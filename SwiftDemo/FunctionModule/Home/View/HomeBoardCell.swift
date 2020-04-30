//
//  HomeBoardCell.swift
//  SwiftDemo
//
//  Created by zhumuzhi on 2020/4/30.
//  Copyright © 2020 zhumuzhi. All rights reserved.
//

import UIKit
import SnapKit

class HomeBoardCell: BaseCollectionViewCell {
    
    // MARK:- ConfigUI
    
    override func configUI() {
        clipsToBounds = true
        
        contentView.addSubview(iconView)
        
//        iconView.snp.makeConstraints { (ConstraintMaker) in
//            // 宽高设置为100
//            make.size.equalTo(100)
//            // 在父视图居中显示
//            make.center.equalToSuperview()
//        }
        
        contentView.addSubview(titleLabel)
        
        contentView.addSubview(descLabel)
        
    }

    // MARK:- Lazy
    
    private lazy var iconView: UIImageView  = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var titleLabel:  UILabel = {
        let titelLabel = UILabel()
        titelLabel.textColor = UIColor.black
        titelLabel.font = UIFont.systemFont(ofSize: 14)
        return titelLabel
    }()
    
    private lazy var descLabel: UILabel = {
        let descLabel = UILabel()
        descLabel.textColor = UIColor.gray
        descLabel.font = UIFont.systemFont(ofSize: 12)
        return descLabel
    }()
    
    
}

