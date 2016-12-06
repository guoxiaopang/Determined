//
//  LastContact.swift
//  Determined
//
//  Created by duoyi on 16/12/5.
//  Copyright © 2016年 duoyi. All rights reserved.
//

import UIKit
import CoreData

public enum ContactType
{
    case QQ;
    case Phone;
    case Message;
    case FaceToFace;
}

@objc(LastContact)
class LastContact: NSManagedObject
{
    var lastContactTime: String?;
    var contactType: ContactType?;
    var uuid : String?;
}
