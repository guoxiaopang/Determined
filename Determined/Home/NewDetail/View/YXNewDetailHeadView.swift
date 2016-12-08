//
//  YXNewDetailHeadView.swift
//  Determined
//
//  Created by duoyi on 16/12/7.
//  Copyright © 2016年 duoyi. All rights reserved.
//

import UIKit
import SnapKit

@objc protocol YXNewDetailHeadViewDelegate
{
    // 点击返回按钮
    @objc optional func clickBack(_ headView : YXNewDetailHeadView);
    
}

class YXNewDetailHeadView: UIView
{
    var delegate : YXNewDetailHeadViewDelegate?;
    
    override init(frame: CGRect)
    {
        super.init(frame: frame);
//        self.backgroundColor = UIColor.init(hex6: 0x3498db);
        self.backgroundColor = UIColor.init(hex6: 0x5677fc);
        self.addSubview(backButton);
        self.addSubview(nameLabel);
        self.addSubview(iconView);
        self.addSubview(lastContactLabel);
        self.addSubview(detailButton);
        self.addLayout();
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - 懒加载
    
    private lazy var backButton : UIButton = {
        let button = UIButton();
        button.setImage(#imageLiteral(resourceName: "back"), for: UIControlState.normal);
        button.setImage(#imageLiteral(resourceName: "backHieght"), for: UIControlState.highlighted);
        button.addTarget(self, action: #selector(clickBackButton), for: UIControlEvents.touchUpInside);
        return button;
    }()
    
    private lazy var detailButton : UIButton = {
        let button = UIButton();
        button.setImage(#imageLiteral(resourceName: "slh"), for: UIControlState.normal);
//        button.addTarget(self, action: #selector(clickBackButton), for: UIControlEvents.touchUpInside);
        return button;
    }()
    
    private lazy var nameLabel : UILabel = {
        let label = UILabel();
        label.text = "John Smith";
        label.font = UIFont.boldSystemFont(ofSize: 20);
        label.textColor = UIColor.white;
        return label;
    }()
    
    private lazy var iconView : UIImageView = {
        let imageView = UIImageView();
        imageView.image = #imageLiteral(resourceName: "t1");
        return imageView;
    }()
    
    private lazy var lastContactLabel : UILabel = {
        let label = UILabel();
        label.font = UIFont(name: "SourceHanSansCN-Light", size: 13);
        label.textColor = UIColor.white;
        label.text = "Last Time : 2016年11月11日 15:30";
        return label;
    }()
    
    // MARK: - Void
    
    func clickBackButton()
    {
        self.delegate?.clickBack!(self);
    }
    
    func addLayout()
    {
        backButton.snp.makeConstraints { (make) in
            make.top.equalTo(self).offset(20);
            make.left.equalTo(self).offset(10);
            make.width.height.equalTo(32);
        }
        
        nameLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(self);
            make.top.equalTo(25);
        }
        
        iconView.snp.makeConstraints { (make) in
            make.centerX.equalTo(self);
            make.top.equalTo(nameLabel.snp.bottom).offset(30);
            make.width.height.equalTo(128);
        }
        
        lastContactLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(self);
            make.top.equalTo(iconView.snp.bottom).offset(25);
        }
        
        detailButton.snp.makeConstraints { (make) in
            make.top.equalTo(self).offset(20);
            make.right.equalTo(self).offset(-10);
            make.width.height.equalTo(32);
        }
    }

}
