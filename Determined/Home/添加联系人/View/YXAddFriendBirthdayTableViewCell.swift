//
//  YXAddFriendBirthdayTableViewCell.swift
//  Determined
//
//  Created by duoyi on 16/12/8.
//  Copyright © 2016年 duoyi. All rights reserved.
//

import UIKit

typealias birthday = (_ birthdayValue : String) -> Void;

class YXAddFriendBirthdayTableViewCell: UITableViewCell, UITextFieldDelegate
{
    var timeInterval : String?;
    var bt : birthday?;
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?)
    {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        NotificationCenter.default.addObserver(self, selector: #selector(change), name: .UITextFieldTextDidChange, object: nil);
        self.backgroundColor = UIColor.init(hex6: 0xecf0f1);
        self.contentView.addSubview(titleField);
        self.addLayout();
        datePick.sendValue = {[weak weakSelf = self] (_ formatValue : String,_ value : String) -> Void in
            weakSelf?.titleField.text = formatValue
            weakSelf?.timeInterval = value
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var titleField : YXTextField = {
        let field = YXTextField();
        field.placeholder = "生日, 农历公历选择";
        field.backgroundColor = UIColor.white;
        field.delegate = self;
        return field;
    }()
    
    private lazy var datePick : YXDatePickerView = {
        let datePick = YXDatePickerView();
        return datePick;
    }()
    
    func addLayout()
    {
        titleField.snp.makeConstraints { (make) in
            make.top.equalTo(self.contentView).offset(5);
            make.bottom.equalTo(self.contentView).offset(-5);
            make.height.equalTo(50);
            make.left.equalTo(self.contentView).offset(25);
            make.right.equalTo(self.contentView).offset(-25);
        }
    }

    public func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool
    {
        // 这里弹出视图
        self.superview?.endEditing(true);
        datePick.show();
        return false;
    }
    
    func change()
    {
        bt!(titleField.text!);
    }

}
