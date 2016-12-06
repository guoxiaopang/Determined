//
//  LastContact.swift
//  Determined
//
//  Created by duoyi on 16/12/5.
//  Copyright © 2016年 duoyi. All rights reserved.
//

import UIKit
import CoreData

enum ContactType : Int
{
    case QQ
    case Phone
    case Message
    case FaceToFace 
}

@objc(LastContact)
class LastContact: NSManagedObject
{
    var lastContactTime: String?;
    var name : String?;
    var uuid : String?;
// FIXME: 这里应该好好看看
    var contactType : ContactType
    {
        set
        {
            let priValue = newValue.rawValue;
            self.willChangeValue(forKey: "contactType");
            self.setPrimitiveValue(priValue, forKey: "contactType");
            self.didChangeValue(forKey: "contactType");
        }
        get
        {
            self.willAccessValue(forKey: "contactType");
            let result = self.primitiveValue(forKey: "contactType") as! Int;
            self.didAccessValue(forKey: "contactType");
            return ContactType(rawValue: result)!;
        }
    }

}
