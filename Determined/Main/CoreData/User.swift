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
     @NSManaged var age: String
     @NSManaged var basicInformation: NSArray
     @NSManaged var birthday: String
     @NSManaged var companyAddress: String
     @NSManaged var companyName: String
     @NSManaged var companyPhone: String
     @NSManaged var constellation: String
     @NSManaged var icon: String
     @NSManaged var iconPath: String
     @NSManaged var contactInfo: NSArray

     @NSManaged var name: String
     @NSManaged var phone: String
     @NSManaged var uuid: String
     @NSManaged var homeTown: String
     @NSManaged var remark: String
}
