//
//  BasicInfo+CoreDataProperties.swift
//  
//
//  Created by duoyi on 16/12/5.
//
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension BasicInfo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<BasicInfo> {
        return NSFetchRequest<BasicInfo>(entityName: "BasicInfo");
    }

    @NSManaged public var title: String?
    @NSManaged public var info: String?

}
