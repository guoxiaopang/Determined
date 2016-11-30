//
//  YXHomeDetailPersonCell.swift
//  Determined
//
//  Created by duoyi on 16/11/30.
//  Copyright © 2016年 duoyi. All rights reserved.
//

import UIKit
import SnapKit

class YXHomeDetailPersonCell: UITableViewCell
{

    override init(style: UITableViewCellStyle, reuseIdentifier: String?)
    {
        super.init(style: style, reuseIdentifier: reuseIdentifier);
        self.contentView.addSubview(titleLabel);
        self.contentView.addSubview(infoLabel);
        self.addLayout();
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var titleLabel : UILabel = {
        let label = UILabel();
        label.textColor = UIColor.init(hex6: 0x8a8a8a);
        label.font = UIFont.systemFont(ofSize: 16);
        label.text = "行业";
        label.numberOfLines = 0;
        return label;
    }()
    
    private lazy var infoLabel : UILabel = {
        let label = UILabel();
        label.textColor = UIColor.init(hex6: 0x2c2c2c);
        label.font = UIFont.systemFont(ofSize: 16);
        label.text = "IT/互联网";
        label.numberOfLines = 0;
        return label;
    }()

    func addLayout() -> Void
    {
        titleLabel.snp.makeConstraints { (make) in
            make.left.top.equalTo(self.contentView).offset(15);
            make.bottom.equalTo(self.contentView).offset(-15);
            make.width.equalTo(80);
        }
        
        infoLabel.snp.makeConstraints { (make) in
            make.left.equalTo(titleLabel.snp.right).offset(15);
            make.top.equalTo(self.contentView).offset(15);
            make.right.equalTo(self.contentView).offset(-15);
            make.bottom.equalTo(self.contentView).offset(-15);
        }
    }
    
    func reloadData(model : YXRecordPersonModel) -> Void {
        titleLabel.text = model.title;
        infoLabel.text = model.info;
    }
}
