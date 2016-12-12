//
//  BasicInfo.swift
//  Determined
//
//  Created by duoyi on 16/12/5.
//  Copyright © 2016年 duoyi. All rights reserved.
//

import UIKit
import CoreData

class BasicInfo: NSObject, NSCoding
{
    // 标题
    var title: String?
    // 内容
    var info: String?
    
    init(title : String, info : String)
    {
        super.init();
        self.info = info;
        self.title = title;
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        title = aDecoder.decodeObject(forKey: "title") as! String?;
        info = aDecoder.decodeObject(forKey: "info") as! String?;
        super.init();
    }
    
    func encode(with aCoder: NSCoder)
    {
        aCoder.encode(title, forKey: "title");
        aCoder.encode(info, forKey: "info");
    }
    
    
//    public func encode(with aCoder: NSCoder)
//    {
//        aCoder.encode(title, forKey: "title");
//        aCoder.encode(info, forKey: "info");
//    }
//    
//    public required init?(coder aDecoder: NSCoder)
//    {
//        super.init(context: <#T##NSManagedObjectContext#>)
//        title = aDecoder.decodeObject(forKey: "title") as! String?;
//        info = aDecoder.decodeObject(forKey: "info") as! String?;
//    }
}


//class BasicInfo: NSObject, NSCoding
//{
//    // 标题
//     var title: String?
//    // 内容
//    var info: String?
//    
//    public func encode(with aCoder: NSCoder)
//    {
//        aCoder.encode(title, forKey: "title");
//        aCoder.encode(info, forKey: "info");
//    }
//    
//    public required init?(coder aDecoder: NSCoder)
//    {
////        super.init(coder: aDecoder)
//        title = aDecoder.decodeObject(forKey: "title") as! String?;
//        info = aDecoder.decodeObject(forKey: "info") as! String?;
//    }
//    
//    
//}

