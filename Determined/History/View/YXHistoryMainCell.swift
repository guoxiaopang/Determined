//
//  YXHistoryMainCell.swift
//  Determined
//
//  Created by duoyi on 16/12/1.
//  Copyright © 2016年 duoyi. All rights reserved.
//

import UIKit

class YXHistoryMainCell: UITableViewCell
{

    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?)
    {
        super.init(style: style, reuseIdentifier: reuseIdentifier);
//        self.contentView.backgroundColor = UIColor.init(hex6: 0xecf0f1);
        self.contentView.layer.cornerRadius = 2;
        self.contentView.clipsToBounds = true;
        self.contentView.addSubview(timeLabel);
        self.contentView.addSubview(nameLabel);
        self.contentView.addSubview(iconView);
        self.contentView.addSubview(timeIconView);
        self.backgroundView = backgroundImageView;
        self.contentView.isOpaque = true;
        self.addLayout();
    }
    
    // MARK: - 懒加载
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var timeLabel : UILabel = {
            let timeLabel = UILabel();
            timeLabel.text = "2016年12月1日 19:45 星期四";
            timeLabel.font = UIFont(name: "SourceHanSansCN-Light", size: 14);
            timeLabel.textColor = UIColor(hex6: 0x7f8c8d);
            timeLabel.backgroundColor = UIColor.init(hex6: 0xfafafa);
            return timeLabel;
    }()
    
    private lazy var nameLabel : UILabel = {
        let nameLabel = UILabel();
        nameLabel.text = "天天天蓝";
        nameLabel.font = UIFont(name: "SourceHanSansCN-Light", size: 20);
        nameLabel.textColor = UIColor(hex6: 0x2c2c2c);
        nameLabel.backgroundColor = UIColor.init(hex6: 0xfafafa);
        return nameLabel;
    }()
    
    private lazy var iconView : UIImageView =
        {
            let iconView = UIImageView();
            iconView.image = #imageLiteral(resourceName: "qq_space");
            return iconView;
    }()
    
    private lazy var timeIconView : UIImageView =
        {
            let iconView = UIImageView();
            iconView.image = #imageLiteral(resourceName: "time");
            return iconView;
    }()
    
    private lazy var backgroundImageView : UIImageView = {
        let imageView = UIImageView();
        var image = #imageLiteral(resourceName: "base");
        let edge = UIEdgeInsets.init(top: 5, left: 5, bottom: 5, right: 5);
        image = image.resizableImage(withCapInsets: edge, resizingMode: UIImageResizingMode.stretch);
        imageView.image = image;
        imageView.contentMode = UIViewContentMode.scaleToFill;
        return imageView;
    }()
    
    // MARK: - Void
    func reloadData(_ model : LastContact) -> Void
    {
        iconView.image = self.type(type: model);
        timeLabel.text = self.timeToString(time: model.lastContactTime!);
        nameLabel.text = model.name;
    }
    
    func addLayout() -> Void
    {
        nameLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.contentView).offset(28);
            make.top.equalTo(self.contentView).offset(25);
            make.right.equalTo(self.contentView).offset(-28);
        }
        
        timeLabel.snp.makeConstraints { (make) in
            make.left.equalTo(timeIconView.snp.right).offset(5);
            make.top.equalTo(nameLabel.snp.bottom).offset(15);
            make.bottom.equalTo(self.contentView).offset(-27);
            make.right.equalTo(self.contentView).offset(-30);
        }
        
        timeIconView.snp.makeConstraints { (make) in
            make.left.equalTo(nameLabel);
            make.centerY.equalTo(timeLabel);
            make.width.equalTo(18);
            make.height.equalTo(19);
        }
        
        iconView.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.contentView);
            make.right.equalTo(self.contentView).offset(-14-14);
            make.width.height.equalTo(16);
        }

    }
    
    // 返回图片
    func type(type : LastContact) -> UIImage
    {
        let tempType = type.contactType;
        switch tempType
        {
        case .QQ:
            return #imageLiteral(resourceName: "qq_space");
        case .FaceToFace:
            return #imageLiteral(resourceName: "facetoface");
        case .Message:
            return #imageLiteral(resourceName: "message");
        case .Phone:
            return #imageLiteral(resourceName: "phone");
        }
    }
    
    // 返回格式化后时间
    func timeToString(time : String) -> String
    {
        // 历史时间搓
        let timeInterval = TimeInterval(time);
        // 当前时间搓
        let now = Date();
        let currTime : TimeInterval = now.timeIntervalSince1970;
        let c : TimeInterval = currTime - timeInterval!;
        if (c / 60 < 1)
        {
            let str = "刚刚";
            return str;
        }
        else if (c / 3600) < 1
        {
            // 时间小于1小时
            let str = "\(Int(c/60))分钟前";
            return str;
        }
        else if ((c / 3600) > 1 && (c / 86400 < 1))
        {
            let str = "\(Int(c/3600))小时前";
            return str;
        }
        else
        {
            let str = "\(Int(c/86400))天前";
            return str;
        }
        
    }

}
