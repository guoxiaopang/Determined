//
//  YXAddFriendHeadView.swift
//  Determined
//
//  Created by duoyi on 16/12/7.
//  Copyright © 2016年 duoyi. All rights reserved.
//

import UIKit

protocol YXAddFriendHeadViewDelegate
{
    func dissMiss(headView : YXAddFriendHeadView);
}

class YXAddFriendHeadView: UIView
{
    var delegate : YXAddFriendHeadViewDelegate?;
    
    override init(frame: CGRect)
    {
        super.init(frame: frame);
        self.addSubview(imageView);
        imageView.addSubview(backButton);
        self.clipsToBounds = true;
        self.addLayout();
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var imageView : UIImageView = {
        let imageView = UIImageView();
        imageView.image = #imageLiteral(resourceName: "dabai");
        imageView.contentMode = UIViewContentMode.scaleToFill;
        imageView.isUserInteractionEnabled = true;
        return imageView;
    }()
    
    private lazy var backButton : UIButton = {
        let button = UIButton();
        button.setImage(#imageLiteral(resourceName: "back"), for: UIControlState.normal);
        button.setImage(#imageLiteral(resourceName: "backHieght"), for: UIControlState.highlighted);
        button.addTarget(self, action: #selector(clickBackButton), for: UIControlEvents.touchUpInside);
        return button;
    }()
    
    func addLayout()
    {
        imageView.snp.makeConstraints { (make) in
            make.edges.equalTo(self);
        }
        
        backButton.snp.makeConstraints { (make) in
            make.top.equalTo(self).offset(20);
            make.left.equalTo(self).offset(10);
            make.width.height.equalTo(32);
        }
    }
    
    func clickBackButton()
    {
        self.delegate?.dissMiss(headView: self);
    }

}
