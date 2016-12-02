//
//  PersonInfo+CoreDataProperties.swift
//  
//
//  Created by duoyi on 16/12/2.
//
//

import Foundation
import CoreData


extension PersonInfo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PersonInfo> {
        return NSFetchRequest<PersonInfo>(entityName: "PersonInfo");
    }

    @NSManaged public var uuid: String?
    @NSManaged public var icon: String?
    @NSManaged public var companyName: String?
    @NSManaged public var companyAddress: String?
    @NSManaged public var companyPhone: String?
    @NSManaged public var birthday: NSDate?
    @NSManaged public var age: String?
    @NSManaged public var constellation: String?
    @NSManaged public var phone: String?
    @NSManaged public var name: String?
    @NSManaged public var lastContact: NSArray?
    @NSManaged public var basicInformation: NSArray?
    @NSManaged public var info: NSArray?

}
