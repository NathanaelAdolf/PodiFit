//
//  Exercise+CoreDataProperties.swift
//  PodiFit
//
//  Created by Griffin on 05/11/20.
//  Copyright © 2020 Nathanael Adolf Sukiman. All rights reserved.
//
//

import Foundation
import CoreData


extension Exercise {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Exercise> {
        return NSFetchRequest<Exercise>(entityName: "Exercise")
    }

    @NSManaged public var idDifficulty: Int32
    @NSManaged public var idExercise: Int32
    @NSManaged public var listIdSteps: [Int]?
    @NSManaged public var namaExercise: String?
    @NSManaged public var videoUrl: String?
    @NSManaged public var warningData: Int64
    @NSManaged public var ofPlan: NSSet?
    @NSManaged public var steps: NSSet?

}

// MARK: Generated accessors for ofPlan
extension Exercise {

    @objc(addOfPlanObject:)
    @NSManaged public func addToOfPlan(_ value: Plan)

    @objc(removeOfPlanObject:)
    @NSManaged public func removeFromOfPlan(_ value: Plan)

    @objc(addOfPlan:)
    @NSManaged public func addToOfPlan(_ values: NSSet)

    @objc(removeOfPlan:)
    @NSManaged public func removeFromOfPlan(_ values: NSSet)

}

// MARK: Generated accessors for steps
extension Exercise {

    @objc(addStepsObject:)
    @NSManaged public func addToSteps(_ value: ExerciseSteps)

    @objc(removeStepsObject:)
    @NSManaged public func removeFromSteps(_ value: ExerciseSteps)

    @objc(addSteps:)
    @NSManaged public func addToSteps(_ values: NSSet)

    @objc(removeSteps:)
    @NSManaged public func removeFromSteps(_ values: NSSet)

}

extension Exercise : Identifiable {

}
