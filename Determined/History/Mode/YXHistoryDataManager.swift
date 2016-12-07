//
//  YXHistoryDataManager.swift
//  Determined
//
//  Created by duoyi on 16/12/6.
//  Copyright © 2016年 duoyi. All rights reserved.
//

import UIKit

protocol YXHistoryDataManagerDelegate
{
    // 数据变动刷新数据
    func reloadData(_ manager : YXHistoryDataManager);
}

class YXHistoryDataManager: NSObject
{
    var delegate : YXHistoryDataManagerDelegate?;
    
    func requestData()
    {
        let array = LastContact.mr_findAllSorted(by: "lastContactTime", ascending: false);
        if array?.count == item.count
        {
            return;
        }
        item.removeAllObjects();
        for i in array!
        {
            item.add(i);
        }
        self.delegate?.reloadData(self);
    }
    
    // 下拉刷新
    func refreshData()
    {
        let array = LastContact.mr_findAllSorted(by: "lastContactTime", ascending: false);
        item.removeAllObjects();
        for i in array!
        {
            item.add(i);
        }
        self.delegate?.reloadData(self);
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
        model.mr_deleteEntity();
    }
}
