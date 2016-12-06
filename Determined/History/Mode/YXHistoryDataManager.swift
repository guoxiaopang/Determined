//
//  YXHistoryDataManager.swift
//  Determined
//
//  Created by duoyi on 16/12/6.
//  Copyright © 2016年 duoyi. All rights reserved.
//

import UIKit

class YXHistoryDataManager: NSObject
{
    func requestData()
    {
        let array = LastContact.mr_findAllSorted(by: "lastContactTime", ascending: true);
        item.removeAllObjects();
        for i in array!
        {
            item.add(i);
        }
    }
    
    private lazy var item : NSMutableArray = {
        let array = NSMutableArray();
        return array;
    }()
    
    // 返回个数
    func numOfRow() -> Int
    {
        return item.count;
    }
    
    // 返回模型
    func modelWithRow(_ index : Int) -> LastContact?
    {
        if index < item.count
        {
            return item[index] as? LastContact;
        }
        return nil;
    }
    
    // 删除历史记录
    func delete(model : LastContact)
    {
        item.remove(model);
        // 写入数据库 这里还没写
    }
}
