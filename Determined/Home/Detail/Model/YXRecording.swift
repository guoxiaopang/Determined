//
//  YXRecording.swift
//  Determined
//
//  Created by duoyi on 16/11/30.
//  Copyright © 2016年 duoyi. All rights reserved.
//

import UIKit
import ObjectMapper

// 用户信息
class YXRecordPersonModel: Mappable
{
    var title : String?;
    var info : String?
    
    required init?(map: Map)
    {
        
    }
    
    func mapping(map: Map)
    {
        title <- map["title"]
        info <- map["info"]
    }
}

// 用户信息外面一层
class YXRecordPersonGroupModel: Mappable
{
    var groupName : [String]?;
    var list : [YXRecordPersonModel]?
    
    required init?(map: Map)
    {
        
    }
    
    func mapping(map: Map)
    {
        groupName <- map["groupName"]
        list <- map["list"]
    }
}

// 时间 地点 人物 事件
class YXRecordThingModel: Mappable
{
    var time : Date?;
    var address : String?;
    var person : String?;
    var info : String?;
    
    required init?(map: Map)
    {
        
    }
    
    func mapping(map: Map)
    {
        time <- map["time"]
        address <- map["address"]
        person <- map["person"]
        info <- map["info"]
    }
}


// 外面一层数据
class YXRecordGroupModel: Mappable
{
    var groupName : String?;
    var list : [YXRecordThingModel]?;
    
    required init?(map: Map)
    {
        
    }
    
    func mapping(map: Map)
    {
        groupName <- map["groupName"]
        list <- map["list"]
    }
}


//groupName : 分组名
//title : [姓名, 电话, 邮箱, 地址, 公司]
//info :[天蓝, 130623062325, 12456@qq.com, 重庆市渝中区, 公司地址]
//
//groupName : 记录
//list
//time : 时间
//address : 在哪里
//person : 人物
//info : 发生了什么事
