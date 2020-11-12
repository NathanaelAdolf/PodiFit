//
//  Warning+CoreDataProperties.swift
//  PodiFit
//
//  Created by Griffin on 12/11/20.
//  Copyright © 2020 Nathanael Adolf Sukiman. All rights reserved.
//
//

import Foundation
import CoreData


extension Warning {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Warning> {
        return NSFetchRequest<Warning>(entityName: "Warning")
    }

    @NSManaged public var idWarning: Int64
    @NSManaged public var warningText: String?
    @NSManaged public var ofExercise: NSSet?

}

// MARK: Generated accessors for ofExercise
extension Warning {

    @objc(addOfExerciseObject:)
    @NSManaged public func addToOfExercise(_ value: Exercise)

    @objc(removeOfExerciseObject:)
    @NSManaged public func removeFromOfExercise(_ value: Exercise)

    @objc(addOfExercise:)
    @NSManaged public func addToOfExercise(_ values: NSSet)

    @objc(removeOfExercise:)
    @NSManaged public func removeFromOfExercise(_ values: NSSet)

}

extension Warning : Identifiable {

}
