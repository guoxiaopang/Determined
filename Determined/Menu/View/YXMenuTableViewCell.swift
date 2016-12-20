//
//  YXMenuTableViewCell.swift
//  Determined
//
//  Created by duoyi on 16/12/14.
//  Copyright © 2016年 duoyi. All rights reserved.
//

import UIKit

class YXMenuTableViewCell: UITableViewCell
{

  // 蓝色文件图标，白色背景
    override init(style: UITableViewCellStyle, reuseIdentifier: String?)
    {
        super.init(style: style, reuseIdentifier: reuseIdentifier);
        self.contentView.addSubview(iconView);
        self.contentView.addSubview(titleLabel)
        self.addLayout();
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var iconView : UIImageView = {
        let image = UIImageView();
        image.image = #imageLiteral(resourceName: "set");
        return image;
    }()
    
    private lazy var titleLabel : UILabel = {
        let label = UILabel();
        label.font = UIFont(name: "Roboto Light", size: 10);
        label.textColor = UIColor.init(hex6: 0x616161);
        return label;
    }()
    
    func addLayout()
    {
        iconView.snp.makeConstraints { (make) in
            make.width.height.equalTo(25);
            make.top.equalTo(self.contentView).offset(32);
            make.bottom.equalTo(self.contentView).offset(-32);
            make.left.equalTo(self.contentView).offset(35);
        }
        
        titleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(iconView.snp.right).offset(34);
            make.centerY.equalTo(iconView);
        }
    }
    
    func reloadData(title : String , imageName : String)
    {
        titleLabel.text = title;
    }
    
    // 选中状态
    func changeStatus(_ flag : Bool)
    {
        if flag
        {
            // 选中
            titleLabel.textColor = UIColor.init(hex6: 0x5677fc);
        }
        else
        {
            titleLabel.textColor = UIColor.init(hex6: 0x616161);
        }
    }

}
