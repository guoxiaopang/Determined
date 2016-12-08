//
//  YXAddFriendDataManager.swift
//  Determined
//
//  Created by duoyi on 16/12/7.
//  Copyright © 2016年 duoyi. All rights reserved.
//

import UIKit
import MagicalRecord

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
    
    func addUser(_ imagePath : String, _ name : String, _ phoneNumber : String,_ birthday : String,_ homeTown : String,_ remark : String)
    {
        let user = User.mr_createEntity();
        user?.uuid = NSUUID().uuidString;
        user?.name = name;
        user?.birthday = birthday; // 这里应该是时间搓
        user?.homeTown = homeTown;
        user?.remark = remark;
        
        NSManagedObjectContext.mr_default().mr_save({ (ctx) in
            print("增加User : \(user?.name)");
        })
    }
    
}
