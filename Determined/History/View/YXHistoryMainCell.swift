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
    
    private lazy var backgroundImageView : UIImageView = {
        let imageView = UIImageView();
        //imageView.frame = CGRect.init(x: 0, y: 0, width: self.contentView.frame.size.width, height: self.contentView.frame.size.height)
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
        timeLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.contentView).offset(14 + 14);
            make.top.equalTo(self.contentView).offset(15 + 10);
            make.right.equalTo(self.contentView).offset(-14-14);
        }
        
        nameLabel.snp.makeConstraints { (make) in
            make.left.equalTo(timeLabel);
            make.top.equalTo(timeLabel.snp.bottom).offset(15);
            make.right.equalTo(timeLabel).offset(-15-15);
            make.bottom.equalTo(self.contentView).offset(-14-14);
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
        let fmt = DateFormatter();
        fmt.dateFormat = "YYYY年MM月dd日 HH:mm ";
        let timeInterval = TimeInterval(time);
        let t = Date.init(timeIntervalSince1970: timeInterval!);
        let str = fmt.string(from: t);
        return str;
    }

}
