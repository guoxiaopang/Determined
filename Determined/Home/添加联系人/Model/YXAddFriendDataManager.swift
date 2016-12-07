//
//  YXAddFriendDataManager.swift
//  Determined
//
//  Created by duoyi on 16/12/7.
//  Copyright © 2016年 duoyi. All rights reserved.
//

import UIKit

class YXAddFriendDataManager: NSObject
{
    lazy var item : NSMutableArray = {
        let array = NSMutableArray();
        array.addObjects(from: ["Email", "生日", "公司名称", "公司地址"]);
        return array;
    }()
    
    func numofRow(index : Int) -> String?
    {
        if index < item.count
        {
            return item[index] as? String;
        }
        return nil;
    }
    
    func num() -> Int
    {
        return item.count;
    }
    
    
}
