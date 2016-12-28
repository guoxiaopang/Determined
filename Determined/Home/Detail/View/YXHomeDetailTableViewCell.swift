//
//  YXHomeDetailTableViewCell.swift
//  Determined
//
//  Created by duoyi on 16/12/22.
//  Copyright © 2016年 duoyi. All rights reserved.
//

import UIKit
import SnapKit

class YXHomeDetailTableViewCell: UITableViewCell
{
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?)
    {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = UIColor.white;
        
        self.contentView.addSubview(titleLabel);
        self.contentView.addSubview(valueLabel);
        self.contentView.addSubview(lineView);
        self.addLayout();
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - 懒加载
    private lazy var titleLabel : UILabel = {
        let label = UILabel();
        label.text = "Title";
        label.font = UIFont(name: "Roboto-Bold", size: 14);
        label.textColor = UIColor.black;
        label.backgroundColor = UIColor.white;
        return label;
    }()
    
    private lazy var valueLabel : UILabel = {
        let label = UILabel();
        label.text = "Value";
        label.font = UIFont(name: "Roboto-Bold", size: 14);
        label.textColor = UIColor.init(hex6: 0x5677fc);
        label.backgroundColor = UIColor.white;
        return label;
    }()
    
    private lazy var lineView : UIView = {
        let view = UIView();
        view.backgroundColor = UIColor.init(hex6: 0xecf0f1);
        return view;
    }()
    
    func addLayout()
    {
        titleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.contentView).offset(10);
            make.top.equalTo(self.contentView).offset(15);
            make.right.equalTo(self.contentView).offset(-10);
        }
        
        lineView.snp.makeConstraints { (make) in
            make.left.equalTo(titleLabel);
            make.right.equalTo(self.contentView).offset(-10);
            make.height.equalTo(1);
            make.top.equalTo(titleLabel.snp.bottom);
        }
        
        valueLabel.snp.makeConstraints { (make) in
            make.left.equalTo(titleLabel);
            make.top.equalTo(lineView.snp.bottom);
            make.bottom.equalTo(self.contentView).offset(-15);
        }
    }

}
