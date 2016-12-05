//
//  User+CoreDataProperties.swift
//  
//
//  Created by duoyi on 16/12/5.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User");
    }

    @NSManaged public var age: String?
    @NSManaged public var basicInformation: NSArray?
    @NSManaged public var birthday: String?
    @NSManaged public var companyAddress: String?
    @NSManaged public var companyName: String?
    @NSManaged public var companyPhone: String?
    @NSManaged public var constellation: String?
    @NSManaged public var icon: String?
    @NSManaged public var contactInfo: NSArray?
    @NSManaged public var lastContact: NSArray?
    @NSManaged public var name: String?
    @NSManaged public var phone: String?
    @NSManaged public var uuid: String?
    @NSManaged public var group: UserGroup?

}
