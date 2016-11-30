//
//  YXHomeTableViewCell.swift
//  Determined
//
//  Created by duoyi on 16/11/29.
//  Copyright © 2016年 duoyi. All rights reserved.
//

import UIKit
import SnapKit

class YXHomeTableViewCell: UITableViewCell
{

    override init(style: UITableViewCellStyle, reuseIdentifier: String?)
    {
        super.init(style: style, reuseIdentifier: reuseIdentifier);
        self.contentView.addSubview(iconView);
        self.contentView.addSubview(nameLabel);
        self.contentView.addSubview(workLabel);
        self.contentView.addSubview(button);
        self.contentView.addSubview(timeLabel);
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
        nameLabel.font = UIFont.systemFont(ofSize: 20);
        return nameLabel;
            
    }()
    
    private lazy var workLabel : UILabel =
    {
        let workLabel = UILabel();
        workLabel.text = "这是工作";
        workLabel.font = UIFont.systemFont(ofSize: 17);
        workLabel.textColor? = UIColor.init(red: 0.534, green: 0.534, blue: 0.534, alpha: 0.534);
        return workLabel;
    }()
    
    private lazy var button : UIButton =
    {
        let button = UIButton();
        button.setTitle("Mark", for: UIControlState.normal);
        button.setBackgroundImage(#imageLiteral(resourceName: "button"), for: UIControlState.normal)
        button.setTitleColor(UIColor.black, for: UIControlState.normal);
        button.titleLabel?.font = UIFont.systemFont(ofSize: 13);
        button.addTarget(self, action: #selector(YXHomeTableViewCell.clickMark), for: UIControlEvents.touchUpInside);
        return button;
    }()
    
    private lazy var timeLabel : UILabel =
    {
        let timeLabel = UILabel();
        timeLabel.text = "2016.11.11 15:12";
        timeLabel.font = UIFont.systemFont(ofSize: 12);
        return timeLabel;
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
            make.right.equalTo(timeLabel.snp.left).offset(-10);
        }
        
        button.snp.makeConstraints { (make) in
            make.centerY.equalTo(nameLabel);
            make.right.equalTo(self.contentView).offset(-10);
        }
        
        timeLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(workLabel);
            make.right.equalTo(self.contentView).offset(-10);
        }
    }
    
    func clickMark() -> Void
    {
        print("mark");
    }
    
    // 加载数据
    func changeValueWithModel(person : Person) -> Void
    {
        iconView.image = UIImage.init(named: person.image!);
        nameLabel.text = person.name;
        workLabel.text = person.work;
       
        let dateFormat = DateFormatter();
        dateFormat.dateFormat = "yyyy年MM月dd日 hh:mm:ss"
        let dateString = dateFormat.string(from: person.lasttime as! Date);
        timeLabel.text = dateString;
    }

}
