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
    var age : NSString?;
    var constellation : NSString?;
    var lastContact : [YXLastContact]?;
    var basicinformation : [Basicinformation]?;
    var contextInfo : [ContextInfo]?;
    
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
