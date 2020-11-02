//
//  Difficulty+CoreDataProperties.swift
//  PodiFit
//
//  Created by Griffin on 02/11/20.
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

}

extension Difficulty : Identifiable {

}
