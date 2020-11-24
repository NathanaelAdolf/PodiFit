//
//  Difficulty+CoreDataProperties.swift
//  PodiFit
//
//  Created by Griffin on 12/11/20.
//  Copyright © 2020 Nathanael Adolf Sukiman. All rights reserved.
//
//

import Foundation
import CoreData


extension Difficulty {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Difficulty> {
        return NSFetchRequest<Difficulty>(entityName: "Difficulty")
    }

    @NSManaged public var idDifficulty: Int32
    @NSManaged public var levelDifficulty: String?
    @NSManaged public var plan: NSSet?

}

// MARK: Generated accessors for plan
extension Difficulty {

    @objc(addPlanObject:)
    @NSManaged public func addToPlan(_ value: Plan)

    @objc(removePlanObject:)
    @NSManaged public func removeFromPlan(_ value: Plan)

    @objc(addPlan:)
    @NSManaged public func addToPlan(_ values: NSSet)

    @objc(removePlan:)
    @NSManaged public func removeFromPlan(_ values: NSSet)

}

extension Difficulty : Identifiable {

}
