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
    
    func request() -> Void
    {
        let path : String = Bundle.main.path(forResource: "home", ofType: "plist")!;
        let array : NSArray = NSArray(contentsOfFile: path)!;
        
        if array.isKind(of: NSArray.classForCoder())
        {
            for dict in array
            {
                let user = Mapper<YXHomeModel>().map(JSON: dict as! [String : Any]);
                groupItem.append(user?.group! as Any);
                item.append(user as Any);
            }
            // 排序
    
    
        }
    }
    
    // 排序方法

    private lazy var item : [Any] = {
        var item = [Any]();
        return item;
    }()
    
    private lazy var groupItem : [Any] = {
        var groupItem = [Any]();
        return groupItem;
    }()
    
    func numberOfSection() -> Int {
        return item.count;
    }
    
    func numofRow(section : NSInteger) -> Int {
        if section < item.count {
            let model : YXHomeModel = item[section] as! YXHomeModel;
            return (model.list?.count)!;
        }
        return 0;
    }
    
    // 返回model
    func modelWithIndex(index : IndexPath) -> Person {
        let model : YXHomeModel = item[index.section] as! YXHomeModel;
        let user : Person = model.list![index.row];
        return user;
    }
    
    // 返回group
    func groupWithSection(section : Int) -> YXHomeModel {
        return item[section] as! YXHomeModel;
    }
    
    // 返回groupArray
    func groupTitle() -> NSArray {
        return groupItem as NSArray ;
    }
}
