//
//  User+CoreDataProperties.swift
//  PodiFit
//
//  Created by Griffin on 02/11/20.
//  Copyright © 2020 Nathanael Adolf Sukiman. All rights reserved.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var height: Int32
    @NSManaged public var idPlan: Int32
    @NSManaged public var idUser: Int32
    @NSManaged public var userName: String?
    @NSManaged public var weight: Int32

}

extension User : Identifiable {

}
