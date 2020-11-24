//
//  ExerciseSteps+CoreDataProperties.swift
//  PodiFit
//
//  Created by Griffin on 12/11/20.
//  Copyright © 2020 Nathanael Adolf Sukiman. All rights reserved.
//
//

import Foundation
import CoreData


extension ExerciseSteps {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ExerciseSteps> {
        return NSFetchRequest<ExerciseSteps>(entityName: "ExerciseSteps")
    }

    @NSManaged public var idStep: Int32
    @NSManaged public var steps: String?
    @NSManaged public var ofExercise: NSSet?

}

// MARK: Generated accessors for ofExercise
extension ExerciseSteps {

    @objc(addOfExerciseObject:)
    @NSManaged public func addToOfExercise(_ value: Exercise)

    @objc(removeOfExerciseObject:)
    @NSManaged public func removeFromOfExercise(_ value: Exercise)

    @objc(addOfExercise:)
    @NSManaged public func addToOfExercise(_ values: NSSet)

    @objc(removeOfExercise:)
    @NSManaged public func removeFromOfExercise(_ values: NSSet)

}

extension ExerciseSteps : Identifiable {

}
