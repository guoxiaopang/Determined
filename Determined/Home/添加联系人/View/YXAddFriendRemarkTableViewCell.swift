//
//  YXAddFriendRemarkTableViewCell.swift
//  Determined
//
//  Created by duoyi on 16/12/8.
//  Copyright © 2016年 duoyi. All rights reserved.
//

import UIKit

class YXAddFriendRemarkTableViewCell: UITableViewCell
{

    override init(style: UITableViewCellStyle, reuseIdentifier: String?)
    {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = UIColor.init(hex6: 0xecf0f1);
        self.contentView.addSubview(textView);
        self.addLayout();
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var textView : YXTextView = {
        let textView = YXTextView();
        textView.layer.borderColor = UIColor.init(hex6: 0xebebeb).cgColor;
        textView.backgroundColor = UIColor.white;
        textView.layer.borderWidth = 1;
        textView.font = UIFont.systemFont(ofSize: 18);
        textView.textContainerInset = UIEdgeInsets.init(top: 13, left: 10, bottom: 13, right: 10);
        textView.placeholder = "备注内容";
    
        return textView;
    }()
    
    func addLayout()
    {
        textView.snp.makeConstraints { (make) in
            make.left.equalTo(self.contentView).offset(25);
            make.right.equalTo(self.contentView).offset(-25);
            make.top.equalTo(self.contentView).offset(5);
            make.bottom.equalTo(self.contentView).offset(-5);
            make.height.equalTo(200);
        }
    }

}
