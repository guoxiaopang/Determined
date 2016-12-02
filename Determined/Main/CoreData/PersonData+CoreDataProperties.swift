//
//  PersonData+CoreDataProperties.swift
//  Determined
//
//  Created by duoyi on 16/12/2.
//  Copyright © 2016年 duoyi. All rights reserved.
//

import Foundation
import CoreData


extension PersonData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PersonData> {
        return NSFetchRequest<PersonData>(entityName: "PersonData");
    }

    @NSManaged public var uuid: String?
    @NSManaged public var data: NSDictionary?

}
