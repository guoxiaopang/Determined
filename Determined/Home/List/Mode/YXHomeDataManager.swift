//
//  YXHomeDataManager.swift
//  Determined
//
//  Created by duoyi on 16/11/29.
//  Copyright © 2016年 duoyi. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper

class YXHomeDataManager: NSObject
{

    func requestData() -> Void
    {
        let array = [UserGroup.mr_findAllSorted(by: "groupString", ascending: true)];
        item.removeAllObjects();
        for i in array[0]!
        {
            item.add(i);
            let group : UserGroup = i as! UserGroup; 
            itemTitle.add(group.groupString!);
        }
    }
    
    public lazy var item : NSMutableArray = {
        let array = NSMutableArray();
        return array;
    }()
    
    // 返回总共组数
    func numOfSection() -> Int {
        return item.count;
    }
    
    // 返回每组数据
    func rowOfSection(_ section : Int) -> Int {
        if  section < item.count
        {
            let array : UserGroup = item[section] as! UserGroup;
            return (array.groupItem!.count);
        }
        else
        {
            return 0;
        }
    }
    
    // 返回model
    func modelWithIndexPath(indexPath : IndexPath) -> User? {
        if  indexPath.section < item.count
        {
            let array : UserGroup = item[indexPath.section] as! UserGroup;
            return (array.groupItem![indexPath.row] as! User);
        }
        return nil;
    }
    
    // 返回右边索引
    public lazy var itemTitle : NSMutableArray = {
        let array = NSMutableArray();
        return array;
    }()
    
    // 删除数据 返回组内还有多少数组
    func remove(user : User) -> UserGroup?
    {
        // 删除model
        for group in item
        {
            let group = group as! UserGroup;
            for i in group.groupItem!
            {
                // 找到这个user
                let i = i as! User;
                if  i == user
                {
                    group.groupItem?.remove(user);
                    // 删除实体
                    user.mr_deleteEntity();
                    return group;
                }
            }
        }
        return nil ;
    }
    
    // 删除组和title
    func deleteSection(group : UserGroup) -> Void
    {
        for gr in item
        {
            let gr = gr as! UserGroup;
            if gr == group
            {
                item.remove(group);
                itemTitle.remove(group.groupString!);
            }
        }
    }
}
