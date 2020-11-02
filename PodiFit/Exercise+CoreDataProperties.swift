//
//  Exercise+CoreDataProperties.swift
//  PodiFit
//
//  Created by Griffin on 02/11/20.
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

}

extension Exercise : Identifiable {

}
