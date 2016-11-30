//
//  YXHomeDetailHeadView.swift
//  Determined
//
//  Created by duoyi on 16/11/30.
//  Copyright © 2016年 duoyi. All rights reserved.
//

import UIKit
import SnapKit
import UIColor_Hex_Swift

class YXHomeDetailHeadView: UIView
{

    override init(frame: CGRect)
    {
        super.init(frame: frame);
        self.backgroundColor = UIColor.white;
        self.addSubview(nameLabel);
        self.addSubview(ageLabel);
        self.addSubview(starLabel);
        self.addSubview(lineView);
        self.addSubview(heartView);
        self.addSubview(likeLabel);
        self.addSubview(shareButton);
        self.addLayout();
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var nameLabel : UILabel = {
        let label = UILabel();
        label.text = "天天天蓝";
        return label;
    }()
    
    private lazy var ageLabel : UILabel = {
        let label = UILabel();
        label.text = "23";
        label.font = UIFont.systemFont(ofSize: 13);
        label.textColor = UIColor.white;
        label.backgroundColor = UIColor(hex6: 0x6495ED);
        label.textAlignment = NSTextAlignment.center;
        label.layer.cornerRadius = 3.0;
        label.clipsToBounds = true;
        return label;
    }()
    
    private lazy var starLabel : UILabel = {
        let label = UILabel();
        label.text = "狮子座";
        label.font = UIFont.systemFont(ofSize: 10);
        label.textColor = UIColor.white;
        label.backgroundColor = UIColor(hex6: 0xFFD700);
        label.textAlignment = NSTextAlignment.center;
        label.layer.cornerRadius = 3.0;
        label.clipsToBounds = true;
        return label;
    }()
    
    private lazy var lineView : UIView = {
        let view : UIView = UIView();
        view.backgroundColor = UIColor(hex6: 0xb2b2b2);
        return view;
    }()
    
    private lazy var heartView : UIImageView = {
        let heartView = UIImageView();
        heartView.image = #imageLiteral(resourceName: "heart");
        return heartView;
    }()
    
    private lazy var likeLabel : UILabel = {
        let like = UILabel();
        like.font = UIFont.systemFont(ofSize: 14);
        like.text = "1200人喜欢了你";
        like.textColor = UIColor.init(hex6: 0xb2b2b2);
        return like;
    }()
    
    private lazy var shareButton : UIButton = {
        let shareButton = UIButton();
        shareButton.setTitle("炫耀一下", for: UIControlState.normal);
        shareButton.setImage(#imageLiteral(resourceName: "share"), for: UIControlState.normal);
        shareButton.setImage(#imageLiteral(resourceName: "shareHight"), for: UIControlState.highlighted);
        shareButton.titleLabel?.font = UIFont.systemFont(ofSize: 14);
        shareButton.setTitleColor(UIColor(hex6:0xdbdbdb), for: UIControlState.normal);
        shareButton.setTitleColor(UIColor(hex6:0x515151), for: UIControlState.highlighted);
        return shareButton;
    }()
    
    func addLayout() -> Void {
        nameLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self).offset(15);
            make.top.equalTo(self).offset(10);
            make.right.equalTo(self).offset(-15);
        }
        
        ageLabel.snp.makeConstraints { (make) in
            make.left.equalTo(nameLabel);
            make.top.equalTo(nameLabel.snp.bottom).offset(10);
            make.width.equalTo(30);
        }
        
        starLabel.snp.makeConstraints { (make) in
            make.left.equalTo(ageLabel.snp.right).offset(5);
            make.top.equalTo(ageLabel);
            make.width.equalTo(40);
            make.height.equalTo(ageLabel);
        }
        
        lineView.snp.makeConstraints { (make) in
            make.left.right.equalTo(self);
            make.height.equalTo(0.5);
            make.top.equalTo(starLabel.snp.bottom).offset(10);
        }
        
        heartView.snp.makeConstraints { (make) in
            make.left.equalTo(nameLabel);
            make.top.equalTo(lineView.snp.bottom).offset(10);
            make.width.height.equalTo(25);
        }
        
        likeLabel.snp.makeConstraints { (make) in
            make.left.equalTo(heartView.snp.right).offset(5);
            make.centerY.equalTo(heartView);
        }
        
        shareButton.snp.makeConstraints { (make) in
            make.top.equalTo(lineView).offset(10);
            make.right.equalTo(self).offset(-10);
        }
    }

}
