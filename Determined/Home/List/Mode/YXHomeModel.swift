//
//  YXHomeModel.swift
//  Determined
//
//  Created by duoyi on 16/11/29.
//  Copyright © 2016年 duoyi. All rights reserved.
//

import UIKit
import ObjectMapper

class YXHomeModel: Mappable
{
    var group : String?;
    var list : [Person]?
    
    required init?(map: Map)
    {
        
    }
    
    func mapping(map: Map)
    {
        group <- map["group"]
        list <- map["list"]
    }
}


class Person: Mappable
{
    var lasttime : NSDate?
    var work : String?;
    var image : String?;
    var name : String?;
    
    required init?(map: Map)
    {
        
    }
    
    func mapping(map: Map)
    {
        lasttime <- map["lasttime"]
        work <- map["work"]
        image <- map["image"]
        name <- map["name"]
    }
}
