//
//  User.swift
//  Determined
//
//  Created by duoyi on 16/12/5.
//  Copyright © 2016年 duoyi. All rights reserved.
//

import UIKit
import CoreData

@objc(User)
class User: NSManagedObject
{
     public var age: String?
     public var basicInformation: NSArray?
     public var birthday: String?
     public var companyAddress: String?
     public var companyName: String?
     public var companyPhone: String?
     public var constellation: String?
     public var icon: String?
     public var contactInfo: NSArray?
     public var lastContact: NSArray?
     public var name: String?
     public var phone: String?
     public var uuid: String?
}
