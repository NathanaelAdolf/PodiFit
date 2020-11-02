//
//  Plan+CoreDataProperties.swift
//  PodiFit
//
//  Created by Muhamad Vicky on 03/11/20.
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
    @NSManaged public var durasiSession: Int64
    @NSManaged public var idDifficulty: Int32
    @NSManaged public var idPlan: Int32
    @NSManaged public var namaPlan: String?

}

extension Plan : Identifiable {

}
