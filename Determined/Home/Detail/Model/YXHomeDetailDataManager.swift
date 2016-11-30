//
//  YXHomeDetailDataManager.swift
//  Determined
//
//  Created by duoyi on 16/11/30.
//  Copyright © 2016年 duoyi. All rights reserved.
//

import UIKit
import ObjectMapper

class YXHomeDetailDataManager: NSObject
{
    var user : YXRecordPersonGroupModel?;
    var info : YXRecordGroupModel?;
    
    func requestData() -> Void
    {
        let path : String = Bundle.main.path(forResource: "detail", ofType: "plist")!;
        let dict : NSDictionary = NSDictionary(contentsOfFile: path)!;
        
        let personDict = dict.value(forKey: "person");
        let infoDict = dict.value(forKey: "info");
        
        user = Mapper<YXRecordPersonGroupModel>().map(JSON: personDict as! [String : Any]);
        
        info = Mapper<YXRecordGroupModel>().map(JSON: infoDict as! [String : Any]);

    }
    
    // 返回总共组数
    func dataSection() -> Int {
        return 2;
    }
    
    // 返回每组数据
    func numofSectionOne() -> Int {
        return (user?.list?.count)!;
    }
    
    func personModelWithIndex(index : Int) -> YXRecordPersonModel {
        let model = user?.list?[index];
        return model!;
    }
    
    // 返回每组数据
    func numofSectionTwo() -> Int {
        return (info?.list?.count)!;
    }
    
    func thingModelWithIndex(index : Int) -> YXRecordThingModel {
        let model = info?.list?[index];
        return model!;
    }

}
