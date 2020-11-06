//
//  User+CoreDataProperties.swift
//  PodiFit
//
//  Created by Griffin on 05/11/20.
//  Copyright © 2020 Nathanael Adolf Sukiman. All rights reserved.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var height: Int32
    @NSManaged public var idUser: Int32
    @NSManaged public var userIdPlan: [Int]?
    @NSManaged public var userName: String?
    @NSManaged public var weight: Int32
    @NSManaged public var img: Data?
    @NSManaged public var plan: NSSet?

}

// MARK: Generated accessors for plan
extension User {

    @objc(addPlanObject:)
    @NSManaged public func addToPlan(_ value: Plan)

    @objc(removePlanObject:)
    @NSManaged public func removeFromPlan(_ value: Plan)

    @objc(addPlan:)
    @NSManaged public func addToPlan(_ values: NSSet)

    @objc(removePlan:)
    @NSManaged public func removeFromPlan(_ values: NSSet)

}

extension User : Identifiable {

}
