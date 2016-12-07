//
//  YXAddFriendThreeTableViewCell.swift
//  Determined
//
//  Created by duoyi on 16/12/7.
//  Copyright © 2016年 duoyi. All rights reserved.
//

import UIKit

class YXAddFriendThreeTableViewCell: UITableViewCell
{

    override init(style: UITableViewCellStyle, reuseIdentifier: String?)
    {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = UIColor.white;
        self.contentView.addSubview(button);
        self.addLayout();
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private lazy var button : UIButton = {
        let button = UIButton();
        button.setTitle("提交", for: UIControlState.normal);
        button.setTitleColor(UIColor.white, for: UIControlState.normal);
        button.imageView?.contentMode = UIViewContentMode.scaleToFill;
        button.setBackgroundImage(#imageLiteral(resourceName: "navagationBar"), for: UIControlState.normal);
        return button;
    }()
    
    func addLayout()
    {
        button.snp.makeConstraints { (make) in
            make.left.equalTo(self.contentView).offset(25);
            make.right.equalTo(self.contentView).offset(-25);
            make.height.equalTo(50);
            make.top.equalTo(self.contentView).offset(5);
            make.bottom.equalTo(self.contentView).offset(-5);
        }
    }
}
