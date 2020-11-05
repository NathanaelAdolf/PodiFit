//
//  Plan+CoreDataProperties.swift
//  PodiFit
//
//  Created by Griffin on 05/11/20.
//  Copyright © 2020 Nathanael Adolf Sukiman. All rights reserved.
//
//

import Foundation
import CoreData


extension Plan {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Plan> {
        return NSFetchRequest<Plan>(entityName: "Plan")
    }

    @NSManaged public var chosenExercise: [Int]?
    @NSManaged public var durasiPlan: Int32
    @NSManaged public var durasiSessionDay: Int64
    @NSManaged public var idDifficulty: Int32
    @NSManaged public var idPlan: Int32
    @NSManaged public var namaPlan: String?
    @NSManaged public var isPlanDone: Bool
    @NSManaged public var jumlahHari: Int32
    @NSManaged public var totalSessionDone: Int32
    @NSManaged public var exercise: NSSet?
    @NSManaged public var ofDifficulty: Difficulty?
    @NSManaged public var ofUser: User?

}

// MARK: Generated accessors for exercise
extension Plan {

    @objc(addExerciseObject:)
    @NSManaged public func addToExercise(_ value: Exercise)

    @objc(removeExerciseObject:)
    @NSManaged public func removeFromExercise(_ value: Exercise)

    @objc(addExercise:)
    @NSManaged public func addToExercise(_ values: NSSet)

    @objc(removeExercise:)
    @NSManaged public func removeFromExercise(_ values: NSSet)

}

extension Plan : Identifiable {

}
