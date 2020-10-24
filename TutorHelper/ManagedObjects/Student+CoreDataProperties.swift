//
//  Student+CoreDataProperties.swift
//  TutorHelper
//
//  Created by Angelina on 24.10.2020.
//
//

import Foundation
import CoreData


extension Student {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Student> {
        return NSFetchRequest<Student>(entityName: "Student")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var firstName: String?
    @NSManaged public var lastName: String?
    @NSManaged public var grade: Int64
    @NSManaged public var phoneNumber: String?
    @NSManaged public var parentName: String?
    @NSManaged public var parentPhoneNumber: String?

}

extension Student : Identifiable {

}
