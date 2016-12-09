//
//  UserGroup.swift
//  Determined
//
//  Created by duoyi on 16/12/5.
//  Copyright © 2016年 duoyi. All rights reserved.
//

import UIKit
import CoreData

@objc(UserGroup)
class UserGroup: NSManagedObject
{
//    var groupItem : NSMutableArray!;
    var groupString : String?;
    lazy var groupItem : NSMutableArray = {
        let array = NSMutableArray();
        return array;
    }()
    
//    func compareGroupItem(group : UserGroup) -> ComparisonResult
//    {
//        let result : ComparisonResult = group.groupString!.compare(self.groupString!);
//        return result;
//    }
}
