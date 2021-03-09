//
//  GuideCell.swift
//  SwiftDemo
//
//  Created by zhumuzhi on 2021/3/5.
//  Copyright © 2021 zhumuzhi. All rights reserved.
//

import UIKit

class GuideCell: UICollectionViewCell {
    
    var imageView: UIImageView!
    
    
    override init(frame: CGRect) {
        super.init(frame: CGRect())
        contentView.backgroundColor = UIColor.white
        self.configUI()
    }
    
    open func configUI() {
        self.imageView = UIImageView()
        self.addSubview(self.imageView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.imageView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        super.layoutSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

