//
//  UserGroup.swift
//  Determined
//
//  Created by duoyi on 16/12/5.
//  Copyright © 2016年 duoyi. All rights reserved.


import UIKit
import CoreData

@objc(UserGroup)
class UserGroup: NSManagedObject
{
    // 组名
    @NSManaged var groupString : String;
    // 存放User的uuid
    @NSManaged var groupItem : NSMutableArray

}
