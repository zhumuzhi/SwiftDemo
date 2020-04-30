//
//  BaseCollectionViewCell.swift
//  SwiftDemo
//
//  Created by zhumuzhi on 2020/4/30.
//  Copyright © 2020 zhumuzhi. All rights reserved.
//

import UIKit

class BaseCollectionViewCell: UICollectionViewCell {
    
    // MARK:- Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK:- ConfigUI
    
    open func configUI() {
        
    }
        
}
