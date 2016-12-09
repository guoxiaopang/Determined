//
//  UserGroup+CoreDataProperties.swift
//  
//
//  Created by duoyi on 16/12/9.
//
//

import Foundation
import CoreData


extension UserGroup {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserGroup> {
        return NSFetchRequest<UserGroup>(entityName: "UserGroup");
    }

    @NSManaged public var groupItem: NSMutableArray?
    @NSManaged public var groupString: String?
    @NSManaged public var age: Int16

}
