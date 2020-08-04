//
//  listCell.swift
//  SwiftDemo
//
//  Created by zhumuzhi on 2020/8/4.
//  Copyright © 2020 zhumuzhi. All rights reserved.
//

import UIKit

class listCell: UITableViewCell {
    //MARK: - SetData
    open var titleName: String = "" {
        didSet {
            self.title.text = titleName
        }
    }
    
    open var isChoose: Bool = false {
        didSet {
            if (isChoose == true) {
                self.title.textColor = UIColor.gray
                self.iconView.backgroundColor = UIColor.gray
            }else {
                self.title.textColor = UIColor.black
                self.iconView.backgroundColor = UIColor.systemBlue
            }
        }
    }
    
    //MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style:style, reuseIdentifier: reuseIdentifier)
      
        self.contentView.addSubview(self.iconView)
        self.contentView.addSubview(self.title)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        self.iconView.snp.makeConstraints { (make) -> Void in
            make.centerY.equalToSuperview()
            make.width.height.equalTo(30)
            make.left.equalTo(self.contentView).offset(20)
        }
        self.iconView.layer.cornerRadius = 15
        
        self.title.snp.makeConstraints { (make)->() in
            make.centerY.equalTo(self.iconView)
            make.left.equalTo(self.iconView.snp.right).offset(20)
        }   
    }
    
    //MARK: - LazyGet
    private lazy var iconView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = UIColor.systemBlue
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private  lazy var title: UILabel = {
        let title = UILabel()
        title.textColor = UIColor.black
        title.font = UIFont.systemFont(ofSize: 12)
        return title
    }()
    
}


