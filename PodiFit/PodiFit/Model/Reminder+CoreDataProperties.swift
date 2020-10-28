//
//  Reminder+CoreDataProperties.swift
//  PodiFit
//
//  Created by Nathanael Adolf Sukiman on 28/10/20.
//  Copyright © 2020 Nathanael Adolf Sukiman. All rights reserved.
//
//

import Foundation
import CoreData


extension Reminder {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Reminder> {
        return NSFetchRequest<Reminder>(entityName: "Reminder")
    }

    @NSManaged public var friday: Bool
    @NSManaged public var hour: String?
    @NSManaged public var isActive: Bool
    @NSManaged public var minute: String?
    @NSManaged public var monday: Bool
    @NSManaged public var reminderName: String?
    @NSManaged public var saturday: Bool
    @NSManaged public var sunday: Bool
    @NSManaged public var thursday: Bool
    @NSManaged public var tuesday: Bool
    @NSManaged public var wednesday: Bool

}
