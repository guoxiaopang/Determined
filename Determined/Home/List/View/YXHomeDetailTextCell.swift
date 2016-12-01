//
//  YXHomeDetailTextCell.swift
//  Determined
//
//  Created by duoyi on 16/12/1.
//  Copyright © 2016年 duoyi. All rights reserved.
//

import UIKit

class YXHomeDetailTextCell: UITableViewCell {

    override init(style: UITableViewCellStyle, reuseIdentifier: String?)
    {
        super.init(style: style, reuseIdentifier: reuseIdentifier);
        self.contentView.addSubview(lineView);
        self.contentView.addSubview(starImageView);
        self.contentView.addSubview(yearLabel);
        self.contentView.addSubview(dayLabel);
        self.contentView.addSubview(contentLabel);
        self.contentView.addSubview(timeLabel);
        self.contentView.addSubview(gpsImageView);
        self.contentView.addSubview(addressLabel);
        self.contentView.addSubview(deleteButton);
        self.contentView.backgroundColor = UIColor(hex6: 0xF5F5F5);
        self.addLayout();
    }
    
    // MARK: - 懒加载
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    // lineView
    private lazy var lineView : UIView = {
        let lineView : UIView = UIView();
        lineView.backgroundColor = UIColor(hex6: 0x888888);
        return lineView;
    }()
    
    // 星星
    
    private lazy var starImageView : UIImageView = {
        let imageView = UIImageView();
        imageView.image = #imageLiteral(resourceName: "heart");
        return imageView;
    }()
    
    //年月
    private lazy var yearLabel : UILabel = {
        let label = UILabel();
        label.text = "2016.08";
        label.font = UIFont.systemFont(ofSize: 12);
        label.textAlignment = NSTextAlignment.right;
        return label;
    }()
    //日
    private lazy var dayLabel : UILabel = {
        let label = UILabel();
        label.text = "6日";
        label.font = UIFont.systemFont(ofSize: 14);
        label.textAlignment = NSTextAlignment.right;
        return label;
    }()
    
    // 内容
    private lazy var contentLabel : UILabel = {
        let label = UILabel();
        label.text = "这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容";
        label.font = UIFont.systemFont(ofSize: 16);
        label.numberOfLines = 0;
        return label;
    }()
    
    // 时间
    private lazy var timeLabel : UILabel = {
        let label = UILabel();
        label.text = "14:32";
        label.font = UIFont.systemFont(ofSize: 12);
        return label;
    }()
    
    //gps
    private lazy var gpsImageView : UIImageView = {
        let imageView = UIImageView();
        imageView.image = #imageLiteral(resourceName: "gps");
        return imageView;
    }()
    
    //address
    private lazy var addressLabel : UILabel = {
        let label = UILabel();
        label.text = "广州市";
        label.font = UIFont.systemFont(ofSize: 12);
        return label;
    }()
    
    // 删除按钮
    private lazy var deleteButton : UIButton = {
        let button = UIButton();
        button.setTitle("删除", for: UIControlState.normal);
        button.setTitleColor(UIColor.red, for: UIControlState.normal);
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12);
        return button;
    }();
    
    func addLayout() -> Void {
        lineView.snp.makeConstraints { (make) in
            make.left.equalTo(self.contentView).offset(70);
            make.top.equalTo(self.contentView);
            make.bottom.equalTo(self.contentView);
            make.width.equalTo(2);
        }
        
        starImageView.snp.makeConstraints({ (make) in
            make.centerX.equalTo(lineView);
            make.top.equalTo(self.contentView).offset(20)
            make.width.height.equalTo(20);
        })
        
        yearLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(35);
            make.top.equalTo(30);
        }
        
        dayLabel.snp.makeConstraints { (make) in
            make.right.equalTo(yearLabel);
            make.bottom.equalTo(yearLabel.snp.top).offset(-3);
        }
        
        contentLabel.snp.makeConstraints { (make) in
            make.left.equalTo(lineView.snp.right).offset(15);
            make.right.equalTo(self.contentView).offset(-15);
            make.top.equalTo(self.contentView).offset(20);
        }
        
        timeLabel.snp.makeConstraints { (make) in
            make.top.equalTo(contentLabel.snp.bottom).offset(10);
            make.bottom.equalTo(self.contentView).offset(-10);
            make.left.equalTo(lineView.snp.right).offset(20);
        }
        
        gpsImageView.snp.makeConstraints { (make) in
            make.centerY.equalTo(timeLabel);
            make.left.equalTo(timeLabel.snp.right).offset(5);
            make.width.height.equalTo(16);
        }
        
        addressLabel.snp.makeConstraints { (make) in
            make.left.equalTo(gpsImageView.snp.right).offset(1);
            make.centerY.equalTo(timeLabel);
        }
        
        deleteButton.snp.makeConstraints { (make) in
            make.right.equalTo(contentLabel).offset(-10);
            make.centerY.equalTo(timeLabel);
        }
    }

}
