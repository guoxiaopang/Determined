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
    let coreData = YXCoreDataManager.shareManager();
    func request() -> Void
    {
        let arr : NSArray = coreData.selected();
        for item in arr
        {
            let personData = item as! PersonData;
            groupItem.add(personData);
            let model = Mapper<YXPersonInfo>().map(JSON: personData.data as! [String : Any]);
            model?.uuid = personData.uuid;
            personItem.add(model!);
        }
        
        
    }
    
    private lazy var personItem : NSMutableArray = {
        var item = NSMutableArray();
        return item;
    }()
    

    
    private lazy var groupItem : NSMutableArray = {
        var groupItem = NSMutableArray();
        return groupItem;
    }()
//    
//    func numberOfSection() -> Int {
////        return item.count;
//        return personItem.count;
//    }
    
    func numberOfRow() -> Int {
        //        return item.count;
        return personItem.count;
    }
    
    // 返回model
    func modelWithIndex(index : IndexPath) -> YXPersonInfo {
        let model : YXPersonInfo = personItem[index.row] as! YXPersonInfo ;
        return model;
    }
    
    // 删除model
    func removeModel(model : YXPersonInfo)
    {
        for group in groupItem
        {
            
            let g = group as! PersonData;
            print(g.uuid!);
            if g.uuid == model.uuid
            {
                coreData.deleteData(personData:g);
                groupItem.remove(g);
                
                for p in personItem
                {
                    let p = p as! YXPersonInfo;
                    if p.uuid == model.uuid
                    {
                        personItem.remove(p);
                    }
                }
            }
        }
    }

}
