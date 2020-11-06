//
//  Badges+CoreDataProperties.swift
//  PodiFit
//
//  Created by Griffin on 05/11/20.
//  Copyright © 2020 Nathanael Adolf Sukiman. All rights reserved.
//
//

import Foundation
import CoreData


extension Badges {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Badges> {
        return NSFetchRequest<Badges>(entityName: "Badges")
    }

    @NSManaged public var firstTimeBadge: Bool
    @NSManaged public var customExerciseBadge: Bool
    @NSManaged public var exerciseAddictBadge: Bool
    @NSManaged public var exerciseMasterBadge: Bool
    @NSManaged public var completePlanBadge: Bool
    @NSManaged public var completeFivePlanBadge: Bool
    @NSManaged public var reminderBadge: Bool

}

extension Badges : Identifiable {

}
