//
//  YXNewDetailTableViewCell.swift
//  Determined
//
//  Created by duoyi on 16/12/7.
//  Copyright © 2016年 duoyi. All rights reserved.
//

import UIKit

class YXNewDetailTableViewCell: UITableViewCell
{

    override init(style: UITableViewCellStyle, reuseIdentifier: String?)
    {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = UIColor.white;
        self.contentView.addSubview(titleLabel);
        self.contentView.addSubview(contentLabel);
        self.addLayout();
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - 懒加载
    private lazy var titleLabel : UILabel = {
        let label = UILabel();
        label.text = "Home";
        label.font = UIFont(name: "Roboto-Bold", size: 18);
        label.textColor = UIColor.init(hex6: 0x5677fc);
        label.backgroundColor = UIColor.white;
        return label;
    }()
    
    private lazy var contentLabel : UILabel = {
        let label = UILabel();
        label.text = "200832147@qq.com";
        label.font = UIFont(name: "Roboto-Bold", size: 18);
        label.textColor = UIColor.init(hex6: 0x5677fc);
        label.backgroundColor = UIColor.white;
        return label;
    }()
    
    // MARK: - Void
    func addLayout()
    {
        titleLabel.snp.makeConstraints { (make) in
            make.left.top.equalTo(self.contentView).offset(15);
        }
        
        contentLabel.snp.makeConstraints { (make) in
            make.left.equalTo(titleLabel);
            make.top.equalTo(titleLabel.snp.bottom).offset(10);
            make.bottom.equalTo(self.contentView).offset(-15);
        }
    }

}
