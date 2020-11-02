//
//  ExerciseSteps+CoreDataProperties.swift
//  PodiFit
//
//  Created by Griffin on 02/11/20.
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

}

extension ExerciseSteps : Identifiable {

}
