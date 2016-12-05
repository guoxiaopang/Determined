//
//  UserGroup+CoreDataProperties.swift
//  
//
//  Created by duoyi on 16/12/5.
//
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension UserGroup {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserGroup> {
        return NSFetchRequest<UserGroup>(entityName: "UserGroup");
    }

    @NSManaged public var groupString: String?
    @NSManaged public var groupItem: NSMutableArray?

}
