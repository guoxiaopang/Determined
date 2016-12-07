//
//  YXAddFriendHeadView.swift
//  Determined
//
//  Created by duoyi on 16/12/7.
//  Copyright © 2016年 duoyi. All rights reserved.
//

import UIKit

class YXAddFriendHeadView: UIView
{
    override init(frame: CGRect)
    {
        super.init(frame: frame);
        self.addSubview(imageView);
        imageView.snp.makeConstraints { (make) in
            make.edges.equalTo(self);
        }
        self.clipsToBounds = true;
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var imageView : UIImageView = {
        let imageView = UIImageView();
        imageView.image = #imageLiteral(resourceName: "dabai");
        imageView.contentMode = UIViewContentMode.scaleToFill;
        return imageView;
    }()

}
