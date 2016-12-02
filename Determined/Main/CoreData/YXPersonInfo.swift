//
//  YXPersonInfo.swift
//  Determined
//
//  Created by duoyi on 16/12/2.
//  Copyright © 2016年 duoyi. All rights reserved.
//

import UIKit
import ObjectMapper

class YXPersonInfo: Mappable
{
    var icon : String?;
    var name : String?
    var birthday : NSDate?;
    var age : String?;
    var constellation : String?;
    var lastContact : [YXLastContact]?;
    var basicinformation : [Basicinformation]?;
    var contextInfo : [ContextInfo]?;
    var uuid : String?;
    
    required init?(map: Map)
    {
        
    }
    
    func mapping(map: Map)
    {
        icon <- map["icon"]
        name <- map["name"]
        birthday <- map["birthday"]
        age <- map["age"]
        constellation <- map["constellation"]
        lastContact <- map["lastContact"]
        basicinformation <- map["basicinformation"]
        contextInfo <- map["contextInfo"]
        uuid <- map["uuid"]
    }
}

class YXPersonData: Mappable
{
    var uuid : String?;
    var dict : [YXPersonInfo]?
    
    required init?(map: Map)
    {
        
    }
    
    func mapping(map: Map)
    {
        uuid <- map["uuid"]
        dict <- map["data"]
    }
}

// 联系数组
class YXLastContact: Mappable
{
    var lastContactTime : NSDate?;
    var contactType : String?
    
    required init?(map: Map)
    {
        
    }
    
    func mapping(map: Map)
    {
        lastContactTime <- map["lastContactTime"]
        contactType <- map["contactType"]
    }
}

// 基础信息
class Basicinformation: Mappable
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

// 关联事情
class ContextInfo: Mappable
{
    var title : String?;
    var info : String?;
    var time : NSDate?;
    var gps : NSString?;
    var imageLocal : [String]?;
    var imageURL : [String]?;
    
    required init?(map: Map)
    {
        
    }
    
    func mapping(map: Map)
    {
        title <- map["title"]
        info <- map["info"]
        time <- map["time"]
        gps <- map["gps"]
        imageLocal <- map["imageLocal"]
        imageURL <- map["imageURL"]
    }
}
