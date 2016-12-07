//
//  YXAddFriendOneTableViewCell.swift
//  Determined
//
//  Created by duoyi on 16/12/7.
//  Copyright © 2016年 duoyi. All rights reserved.
//

import UIKit

class YXAddFriendOneTableViewCell: UITableViewCell
{

    override init(style: UITableViewCellStyle, reuseIdentifier: String?)
    {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = UIColor.init(hex6: 0xecf0f1);
        
        self.contentView.addSubview(iconView);
        self.contentView.addSubview(nameField);
        self.contentView.addSubview(phoneField);
        self.addLayout();
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var nameField : YXTextField = {
        let field = YXTextField();
        field.backgroundColor = UIColor.white;
        field.placeholder = "姓名, 必填";
        field.layer.borderColor = UIColor.init(hex6: 0xebebeb).cgColor;
//        field.font = UIFont(name: "Roboto-Bold", size: 18);
        field.layer.borderWidth = 1;
        return field;
    }()
    
    private lazy var phoneField : YXTextField = {
        let field = YXTextField();
        field.placeholder = "电话";
        field.backgroundColor = UIColor.white;
//        field.font = UIFont(name: "Roboto-Bold", size: 18);
        field.layer.borderColor = UIColor.init(hex6: 0xebebeb).cgColor;
        field.layer.borderWidth = 1;
        field.keyboardType = UIKeyboardType.numberPad;
        return field;
    }()
    
    lazy var iconView: UIImageView = {
        let imageView = UIImageView();
        imageView.image = #imageLiteral(resourceName: "inputImage");
        return imageView;
    }()
    
    func addLayout()
    {
        iconView.snp.makeConstraints { (make) in
            make.left.top.equalTo(self.contentView).offset(25);
            make.width.height.equalTo(100);
            make.bottom.equalTo(self.contentView).offset(-25);
        }
        
        nameField.snp.makeConstraints { (make) in
            make.left.equalTo(iconView.snp.right).offset(10);
            make.top.equalTo(iconView);
            make.right.equalTo(self.contentView).offset(-25);
            make.height.equalTo(iconView.snp.height).multipliedBy(0.5);
        }
        
        phoneField.snp.makeConstraints { (make) in
            make.left.equalTo(nameField);
            make.top.equalTo(nameField.snp.bottom).offset(-1);
            make.right.equalTo(nameField);
            make.bottom.equalTo(iconView);
        }
    }
}
