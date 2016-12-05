//
//  LastContact+CoreDataProperties.swift
//  
//
//  Created by duoyi on 16/12/5.
//
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension LastContact {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<LastContact> {
        return NSFetchRequest<LastContact>(entityName: "LastContact");
    }

    @NSManaged public var lastContactTime: String?
    @NSManaged public var contactType: String?

}
