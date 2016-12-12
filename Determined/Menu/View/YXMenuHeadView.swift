//
//  YXMenuHeadView.swift
//  Determined
//
//  Created by duoyi on 16/12/12.
//  Copyright © 2016年 duoyi. All rights reserved.
//

import UIKit

class YXMenuHeadView: UIView
{
    override init(frame: CGRect)
    {
        super.init(frame: frame);
        self.addSubview(iconView);
        self.addSubview(nameLabel);
        self.addLayout();
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var iconView : UIImageView = {
        let iconView = UIImageView();
        iconView.image = #imageLiteral(resourceName: "t1");
        return iconView;
    }()
    
    private lazy var nameLabel : UILabel = {
        let label = UILabel();
        label.font = UIFont(name: "SourceHanSansCN-Light", size: 14);
        label.text = "Leo宇";
        return label;
    }()
    
    func addLayout()
    {
        iconView.snp.makeConstraints { (make) in
            make.top.equalTo(self).offset(60);
            make.center.equalTo(self);
            make.width.height.equalTo(64);
        }
        
        nameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(iconView.snp.bottom).offset(10);
            make.centerX.equalTo(self);
        }
    }

}
