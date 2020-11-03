//
//  TestEntity+CoreDataProperties.swift
//  PodiFit
//
//  Created by Griffin on 02/11/20.
//  Copyright © 2020 Nathanael Adolf Sukiman. All rights reserved.
//
//

import Foundation
import CoreData


extension TestEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TestEntity> {
        return NSFetchRequest<TestEntity>(entityName: "TestEntity")
    }

    @NSManaged public var planname: String?
    @NSManaged public var duration: String?

}

extension TestEntity : Identifiable {

}
