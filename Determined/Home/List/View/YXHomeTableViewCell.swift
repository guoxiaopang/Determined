//
//  YXHomeTableViewCell.swift
//  Determined
//
//  Created by duoyi on 16/11/29.
//  Copyright © 2016年 duoyi. All rights reserved.
//

import UIKit
import SnapKit
import MagicalRecord

class YXHomeTableViewCell: UITableViewCell
{
    var tempUser : User?;
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?)
    {
        super.init(style: style, reuseIdentifier: reuseIdentifier);
        
        self.contentView.addSubview(iconView);
        self.contentView.addSubview(nameLabel);
        self.contentView.addSubview(workLabel);
        self.contentView.addSubview(button);
        self.isOpaque = true;
        self.backgroundColor = UIColor.white;
        self.addLayout();
    }
    
    // MARK: - 懒加载
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var iconView : UIImageView =
    {
        let iconView = UIImageView();
        iconView.image = UIImage.init(named: "icon");
        return iconView;
    }()
    
    private lazy var nameLabel : UILabel =
    {
        let nameLabel = UILabel();
        nameLabel.text = "名字";
        nameLabel.font = UIFont(name: "SourceHanSansCN-Light", size: 20);
        nameLabel.isOpaque = true;
        nameLabel.backgroundColor = UIColor.white;
    
        return nameLabel;
            
    }()
    
    private lazy var workLabel : UILabel =
    {
        let workLabel = UILabel();
        workLabel.text = "这是工作";
        workLabel.font = UIFont(name: "SourceHanSansCN-Light", size: 17);
        workLabel.textColor? = UIColor.init(red: 0.534, green: 0.534, blue: 0.534, alpha: 0.534);
        workLabel.backgroundColor = UIColor.white;
        return workLabel;
    }()
    
    private lazy var button : UIButton =
    {
        let button = UIButton();
        button.setTitle("Mark", for: UIControlState.normal);
        button.setBackgroundImage(#imageLiteral(resourceName: "button"), for: UIControlState.normal)
        button.setTitleColor(UIColor.black, for: UIControlState.normal);
        button.backgroundColor = UIColor.white;
        button.titleLabel?.font = UIFont(name: "SourceHanSansCN-Light", size: 13);
        button.addTarget(self, action: #selector(YXHomeTableViewCell.clickMark), for: UIControlEvents.touchUpInside);
        button.isOpaque = true;
        button.sizeToFit();
        return button;
    }()
    
    // MARK: - Void
    func addLayout() -> Void
    {
        iconView.snp.makeConstraints { (make) in
            make.top.left.equalTo(self.contentView).offset(20);
            make.bottom.equalTo(self.contentView.snp.bottom).offset((-20));
            make.width.height.equalTo(54.0);
        }
        
        nameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(iconView);
            make.left.equalTo(iconView.snp.right).offset(10);
        }
        
        workLabel.snp.makeConstraints { (make) in
            make.left.equalTo(nameLabel);
            make.bottom.equalTo(iconView.snp.bottom);
            make.right.equalTo(button.snp.left).offset(-10);
        }
        
        button.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.contentView);
            make.right.equalTo(self.contentView).offset(-10);
            make.width.equalTo(50);
        }
        
    }
    
    func clickMark() -> Void
    {
        // 添加数据进数据库
        let contact = LastContact.mr_createEntity();
        contact?.contactType = ContactType.QQ;
        contact?.uuid = tempUser?.uuid;
        contact?.name = tempUser?.name;
        contact?.lastContactTime = String(NSDate().timeIntervalSince1970);
        NSManagedObjectContext.mr_default().mr_saveToPersistentStore {(success, error) in
            if success
            {
               print("mark")
            }
            else if ((error) != nil)
            {
                print(error.debugDescription);
            }
        }
        
    }
    
    // 加载数据
    func reloadData(user : User) -> Void
    {
        tempUser = user;
        if user.iconPath.characters.count > 0
        {
            let path = YXFileManager.share.relativePath("image", user.iconPath);
            let data = NSData.init(contentsOfFile: path);
            if data != nil
            {
                iconView.image = UIImage.init(data: data as! Data)
            }
            else
            {
                // 网络加载图片
            }
            
        }
        else
        {
            iconView.image = UIImage.init(named: user.icon);
        }
        
        nameLabel.text = user.name;
        workLabel.text = user.companyName;
    }

}
