//
//  YXAddFriendOneTableViewCell.swift
//  Determined
//
//  Created by duoyi on 16/12/7.
//  Copyright © 2016年 duoyi. All rights reserved.
//

import UIKit

protocol YXAddFriendOneTableViewCellDelegate
{
    func selectedPhoto(_ cell : YXAddFriendOneTableViewCell);
}

typealias oneCellClsure = (_ name : String, _ phoneNumber : String, _ imagePath : String)-> Void;

class YXAddFriendOneTableViewCell: UITableViewCell
{
    var one : oneCellClsure!;
    var delegate : YXAddFriendOneTableViewCellDelegate?;
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?)
    {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = UIColor.init(hex6: 0xecf0f1);
        
        self.contentView.addSubview(iconView);
        self.contentView.addSubview(nameField);
        self.contentView.addSubview(phoneField);
        self.addLayout();
        
        NotificationCenter.default.addObserver(self, selector: #selector(change), name: .UITextFieldTextDidChange, object: nil);
    }
    
    deinit
    {
        NotificationCenter.default.removeObserver(self);
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public lazy var nameField : YXTextField = {
        let field = YXTextField();
        field.backgroundColor = UIColor.white;
        field.placeholder = "姓名, 必填";
        return field;
    }()
    
    lazy var phoneField : YXTextField = {
        let field = YXTextField();
        field.placeholder = "电话";
        field.backgroundColor = UIColor.white;
        field.keyboardType = UIKeyboardType.numberPad;
        return field;
    }()
    
    lazy var iconView: UIImageView = {
        let imageView = UIImageView();
        imageView.image = #imageLiteral(resourceName: "inputImage");
        imageView.isUserInteractionEnabled = true;
        let tap = UITapGestureRecognizer.init(target: self, action: #selector(uploadImage));
        imageView.addGestureRecognizer(tap);
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
    
    func change()
    {
      
        // 图片应该存路径
        one(nameField.text!, phoneField.text!, "");
    }
    
    func reloadData(_ name : String,_ phoneNumber : String,_ imagePath : String)
    {
        nameField.text = name;
        phoneField.text = phoneNumber;
        if imagePath.characters.count > 0
        {
            iconView.image = UIImage.init(contentsOfFile: imagePath);

        }
    }
    
    // 选择图片
    func uploadImage()
    {
        delegate?.selectedPhoto(self);
    }
}
