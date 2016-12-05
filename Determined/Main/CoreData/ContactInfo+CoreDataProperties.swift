//
//  ContactInfo+CoreDataProperties.swift
//  
//
//  Created by duoyi on 16/12/5.
//
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension ContactInfo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ContactInfo> {
        return NSFetchRequest<ContactInfo>(entityName: "ContactInfo");
    }

    @NSManaged public var title: String?
    @NSManaged public var info: String?
    @NSManaged public var time: String?
    @NSManaged public var gps: String?
    @NSManaged public var imageLocal: NSObject?
    @NSManaged public var imageRemote: NSObject?

}
